$ProgressPreference = 'SilentlyContinue'
$startingDir = $pwd
# Set web calls to use TLS 1.2 // RIP Win 7 .net 4 plebs
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# For unzipping, not everyone has PS5
Add-Type -AssemblyName System.IO.Compression.FileSystem
# Wow dir to move junk to 
$wowDir = "C:\Program Files (x86)\World of Warcraft Beta\"
$addons = Get-Content $PSScriptRoot\addon-urls.txt
$tempDir = "C:\Temp\Addons"

# Check WoW dir
if (!(Test-Path $wowDir\WowB.exe)) {
    Write-Warning "WoW Directory not detected"
    do {
        $wowDir = Read-Host "Where is your WoW BfA Alpha Installed? P.S You can update the script to prevent this"
    } until (Test-Path $wowDir\WowB.exe)
}

# Update our WowDir to include addon directory
$wowDir = $wowDir + "\Interface\Addons"
$wowDir = $wowDir.Replace("\\","\")

Write-Host "[Info] Using $wowDir as your addon directory. You have 10 seconds to cancel" -ForegroundColor Magenta
Start-Sleep -s 10 

# Helper function
function Expand-Addon {
    param(
        [string]$zipfile, 
        [string]$outpath
    )
    Write-Host "[Info] Extracting $zipFile to $outpath" -ForegroundColor Green
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

# Create our temp directory
if (!(Test-Path $tempDir)) {
    mkdir $tempDir | Out-Null
}  

# Download our addons
foreach ($addon in $addons) {
    Push-Location $tempDir
    Write-Host "[Info] Downloading $addon" -ForegroundColor Cyan
    Invoke-WebRequest $addon -OutFile ($addon).Split("/")[-1]
    $zipFile = Get-ChildItem | Where-Object {$_.Extension -like ".zip"} | Select-Object -expand Name
    Expand-Addon -zipfile "$tempDir\$zipFile" -outpath "$tempDir"
    $addonFolders = Get-ChildItem $tempDir | Where-Object {$_.PSIsContainer} | Select-Object -expand FullName
    # Get all the folders, if there's a toc in one of them then it must be the root one
    # If there isn't, then the toc must be 1 level deeper
    foreach ($folder in $addonFolders) {
       $tocFiles = Get-ChildItem $tempDir -Depth 1 | Where-Object {$_.Extension -like ".toc"} | Select-Object -expand FullName
       if (!($tocFiles)) {
            Push-Location $folder
            $tocFiles = Get-ChildItem -Depth 1 | Where-Object {$_.Extension -like ".toc"} | Select-Object -expand FullName
            Pop-Location
       }
    
        foreach ($toc in $tocFiles) {
            $addonFullFolder = (Get-Item $toc).Directory.FullName
            $addonDir = (Get-Item $toc).Directory.Name
            $addonName = $toc.Split("\")[-1].Replace(".toc","")
            Write-Host "[Info] Copying $addonName to $wowDir" -ForegroundColor White
            Copy-Item -Path $addonFullFolder -Recurse -Destination $wowDir -Force
            if ($addonName -notlike $addonDir) {
                Rename-Item -Path "$wowDir\$addonDir" -NewName "$wowDir\$addonName"
            }
        }
        Get-ChildItem $addonFolder -Recurse | Remove-Item -Recurse -Force
        Get-Item $folder | Remove-Item -Recurse -Force
        Get-Item $zipFile | Remove-Item -Force
    }
}

Push-Location $startingDir
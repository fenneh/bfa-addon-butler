$ProgressPreference = 'SilentlyContinue'
$startingDir = $pwd
# Set web calls to use TLS 1.2 // RIP Win 7 .net 4 plebs
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
# For unzipping, not everyone has PS5
Add-Type -AssemblyName System.IO.Compression.FileSystem
# Wow dir to move junk to 
$wowDir = "C:\Program Files (x86)\World of Warcraft Beta\"
$addons = @("https://git.tukui.org/elvui/elvui/repository/Beta/archive.zip",
            "https://github.com/BigWigsMods/BigWigs/archive/master.zip",
            "https://github.com/BigWigsMods/LittleWigs/archive/master.zip",
            "https://github.com/kesava-wow/kuinameplates2/archive/bfa.zip",
            "https://github.com/WeakAuras/WeakAuras2/archive/8.0.zip")

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

Write-Host "[Info] Using $wowDir as your addon diretory. You have 10 seconds to cancel" -ForegroundColor Magenta
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
    $addonFolders = Get-ChildItem | Where-Object {$_.PSIsContainer} | Select-Object -expand FullName
    # Get all the folders, if there's a toc in one of them then it must be the root one
    # If there isn't, then the toc must be 1 level deeper
    foreach ($folder in $addonFolders) {
       $tocFiles = Get-ChildItem -Depth 1 | Where-Object {$_.Extension -like ".toc"} | Select-Object -expand FullName
       if (!($tocFiles)) {
            Push-Location $folder
            $tocFiles = Get-ChildItem -Depth 1 | Where-Object {$_.Extension -like ".toc"} | Select-Object -expand FullName
            Pop-Location
       }
    
        foreach ($toc in $tocFiles) {
            $addonFolder = (Get-Item $toc).Directory.FullName
            $addonName = $toc.Split("\")[-1].Replace(".toc","")
            Write-Host "[Info] Copying $addonName to $wowDir" -ForegroundColor White
            Copy-Item -Path $addonFolder -Destination $wowDir -Force
        }
        Get-ChildItem -Recurse | Remove-Item -Recurse -Force
    }
}

Push-Location $startingDir
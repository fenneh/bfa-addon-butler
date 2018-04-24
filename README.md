# BfA Addon Butler

Very crude script to download the latest alpha addons and slam them in your wow beta directory.

# HOW I DO DIS?

* Download this [repo](https://github.com/fenneh/bfa-addon-butler/archive/master.zip) and extract somewhere.

## Config

* If your Alpha install isn't in the default location then modify `Get-WowAlphaAddons.ps1` with notepad or some text editor and update the `$wowDir` variable at the top **OR** run the script and you'll be prompted to enter the location of your WoW install.

## Adding/Changing addons

* Update `addon-urls.txt` with the links to the zip files that you want

## Running

* Open Powershell
* Run the script like below
```
# fench at Sundown in C:\Dev\git\bfa-addon-butler [19:41:22]
➜  .\Get-WoWAlphaAddons.ps1
[Info] Downloading https://git.tukui.org/elvui/elvui/repository/Beta/archive.zip
[Info] Extracting C:\Temp\Addons\archive.zip to C:\Temp\Addons
[Info] Copying ElvUI to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying ElvUI_Config to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/BigWigsMods/BigWigs/archive/master.zip
[Info] Extracting C:\Temp\Addons\master.zip to C:\Temp\Addons
[Info] Copying BigWigs to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/BigWigsMods/LittleWigs/archive/master.zip
[Info] Extracting C:\Temp\Addons\master.zip to C:\Temp\Addons
[Info] Copying LittleWigs to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/kesava-wow/kuinameplates2/archive/bfa.zip
[Info] Extracting C:\Temp\Addons\bfa.zip to C:\Temp\Addons
[Info] Copying Kui_Media to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_BarAuras to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_Core to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_Core_Config to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_Example to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_PreLegion to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/WeakAuras/WeakAuras2/archive/8.0.zip
[Info] Extracting C:\Temp\Addons\8.0.zip to C:\Temp\Addons
[Info] Copying WeakAuras to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying WeakAurasModelPaths to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying WeakAurasOptions to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying WeakAurasTemplates to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
```
# BfA Addon Butler

Very crude script to download the latest alpha addons and slam them in your wow beta directory.

# HOW I DO DIS?

* Download this [repo](https://github.com/fenneh/bfa-addon-butler/archive/master.zip) and extract somewhere.

## Config

* If your Beta install isn't in the default location then modify `Get-WowBetaAddons.ps1` with notepad or some text editor and update the `$wowDir` variable at the top **OR** run the script and you'll be prompted to enter the location of your WoW install.

## Adding/Changing addons

* Update `addon-urls.txt` with the links to the zip files that you want

## Running

* Double click `Get-WoWBetaAddons.bat` OR run `Get-WowBetaAddons.ps1` direct through Powershell

You should see an output similiar to the below.

```
# fench at Sundown in C:\Dev\git\bfa-addon-butler on git:master ≣ +1 ~1 -0 ! [20:57:21]
➜  .\Get-WowBetaAddons.bat
[Info] Using C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons as your addon directory. You have 10 seconds to cancel
[Info] Downloading https://git.tukui.org/elvui/elvui/repository/Beta/archive.zip
[Info] Extracting C:\Temp\Addons\butler\archive.zip to C:\Temp\Addons\butler
[Info] Copying ElvUI to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying ElvUI_Config to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/BigWigsMods/BigWigs/releases/download/v97.1/BigWigs-v97.1.zip
[Info] Extracting C:\Temp\Addons\butler\BigWigs-v97.1.zip to C:\Temp\Addons\butler
[Info] Copying BigWigs to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Antorus to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_ArgusInvasionPoints to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_BrokenIsles to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Core to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Nighthold to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Nightmare to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Options to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Plugins to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_TombOfSargeras to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_TrialOfValor to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying BigWigs_Uldir to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/BigWigsMods/LittleWigs/releases/download/v7.3.27/LittleWigs-v7.3.27.zip
[Info] Extracting C:\Temp\Addons\butler\LittleWigs-v7.3.27.zip to C:\Temp\Addons\butler
[Info] Copying LittleWigs to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/kesava-wow/kuinameplates2/archive/bfa.zip
[Info] Extracting C:\Temp\Addons\butler\bfa.zip to C:\Temp\Addons\butler
[Info] Copying Kui_Media to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_Core to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Kui_Nameplates_Core_Config to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://github.com/WeakAuras/WeakAuras2/archive/8.0.zip
[Info] Extracting C:\Temp\Addons\butler\8.0.zip to C:\Temp\Addons\butler
[Info] Copying WeakAuras to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying WeakAurasModelPaths to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying WeakAurasOptions to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying WeakAurasTemplates to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Downloading https://www.wowinterface.com/downloads/dl23056/Details-ALPHA-8.0.1.v10.zip
[Info] Extracting C:\Temp\Addons\butler\Details-ALPHA-8.0.1.v10.zip to C:\Temp\Addons\butler
[Info] Copying Details to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Copying Details_EncounterDetails to C:\Program Files (x86)\World of Warcraft Beta\Interface\Addons
[Info] Cleaning up C:\Temp\Addons\butler
**** LA FIN ****
```
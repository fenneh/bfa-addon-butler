# bfa-addon-butler

PowerShell script to bulk download and install WoW addons for Battle for Azeroth beta/alpha. From back when we needed addons on day one of beta.

## Usage

1. Edit `addon-urls.txt` with zip URLs for your addons
2. Run `Get-WoWBetaAddons.bat` or `Get-WowBetaAddons.ps1`
3. Addons get downloaded, extracted, and copied to your WoW beta install

## Configuration

Edit `$wowDir` in `Get-WowBetaAddons.ps1` if your beta install isn't in the default location. Or just run the script and it'll ask.

## Note

This was built for BfA beta. Probably works for other betas too, but no promises.

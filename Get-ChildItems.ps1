################################################################################
# PowerShell Tips
# http://technet.microsoft.com/en-us/library/hh848797.aspx
#
# Get-ChildItem cmdlet
# http://technet.microsoft.com/en-us/library/ee692796.aspx
################################################################################

# Get list of folders equivalent to "dir /AH"
Get-ChildItem C:\ -force| Where-Object {$_.mode -match "h"}

# Examples
$folderPath = "C:\Scripts"

Test-Path -Path $folderPath

Get-ChildItem $folderPath -Recurse -filter "*.ps1"

Get-ChildItem $folderPath\PSTips # | Select-Object Name

(Get-ChildItem $folderPath\PSTips).count


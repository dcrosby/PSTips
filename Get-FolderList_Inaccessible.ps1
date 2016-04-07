##############################################################################
# PowerShell.com PowerTips
# Search directory paths recursively for files - list inaccessible folders
#
# Logs all errors in the variable $ErrorList and lists all folders that were inaccessible
# http://powershell.com/cs/blogs/tips/archive/2014/10/09/finding-files-plus-errors.aspx?elq=3a89f008658f4135a33b628acec20f56&elqCampaignId=569&elqaid=6136&elqat=1&elqTrackId=afeb9d91a3bf425d8e908600a73f3c6d
##############################################################################
# All PowerShell Versions

$filePath = "C:\PowerShell"

$PSScripts = Get-ChildItem -Path $filePath -Filter *.ps1 -Recurse -ErrorAction SilentlyContinue -ErrorVariable ErrorList

$ErrorList | ForEach-Object {
  Write-Warning ('Access denied: ' + $_.CategoryInfo.TargetName)
}


<#
When you use Get-ChildItem to recursively search directory paths for files, 
you may stumble across subfolders where you do not have enough privileges. 
To suppress errors, you may use –ErrorAction SilentlyContinue.

That’s fine and good practice, but maybe you’d like to get a list of the folders that you actually had no access to, too.
#>
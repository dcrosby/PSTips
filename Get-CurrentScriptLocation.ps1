###############################################################
# David Crosby
# Date: 12/7
2/2014
# Filename: Get-CurrentScriptLocation.ps1
# Note:  Doesn't work interactively - Only works when calling the script
###############################################################

. .\Get-CurrentScriptLocation.ps1

# Get the path to the location of the current script (parent)
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition


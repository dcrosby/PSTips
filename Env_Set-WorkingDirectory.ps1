#####################################################################################
# Set the Working Directory location to the path of the running script (THIS SCRIPT)
# 
# Uses:
#    Set-Location
#    Split-Path
#    Get-Date
#####################################################################################

# Set the Working Directory location to the path of the running script (THIS SCRIPT)
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Set-Location $scriptPath

# Create a dynamic filename to save the Service Status
$baseFileName = "Services-Status"
$fileType = ".xml"
$computerName = $env:COMPUTERNAME
$timeToday = Get-Date -Format "yyyy-MM-dd-HHmmss"
# Output filename:
# $outputFile = $scriptPath + "\" + $computerName + "_" + $baseFileName + "_" + $timeToday + $fileType

###################################################################
# Save a Desired State Service comparison file
$outputFile = $scriptPath + "\" + $computerName + "_" + $baseFileName + $fileType
$serviceProfile = $scriptPath + "\" + $computerName + "_ServicesProfile" + $fileType
###################################################################

################################################################
# Logfile Management
#
# Initialize a log file name using today's date
# Check for the existance of a previous lof file
# Create the log folder if it doesn't exist
################################################################


# Initialize the log file and folder
################################################################
[String]$dateToday = Get-Date -Format yyyy-M-dd
$logFolder = "E:\Reports\"
$logFile = "Report_DisabledFeatures_"  + ($dateToday) + ".txt"
$outPath = $logFolder + $logFile
if (Test-Path $logFile) {Remove-Item -Path $logFile} ELSE {IF (!(Test-Path -Path $logFolder)) {New-Item $logFolder -ItemType directory} }


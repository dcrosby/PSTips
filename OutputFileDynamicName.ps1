# Build a custom output filename with Date and Computer name

$outputFolder = "C:\System\"
$baseFileName = "Sample_Output_File"
$fileType = ".txt"

$computerName = $env:COMPUTERNAME
$dateToday = Get-Date -Format "yyyy-MM-dd"

$timeToday = Get-Date -Format "yyyy-MM-dd-HHmmss"

$timeToday = Get-Date # -Format  "yyyy-MM-dd-HH-mm-ss"

$outputFile = $outputFolder + $computerName + "_" + $baseFileName + "_" + $dateToday + $fileType



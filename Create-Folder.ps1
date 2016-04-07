
# Examples
$folderPath = "C:\Scripts"

# Test-Path
if (Test-Path -Path $folderPath) {Set-Location $folderPath}

# New-Item
if (!(Test-Path $folderPath\Output)) {New-Item $folderPath\Output -type directory}

# Remove-Item
if (Test-Path $folderPath\Output) {Remove-Item $folderPath\Output}

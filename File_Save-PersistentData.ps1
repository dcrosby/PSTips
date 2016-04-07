

#requires -Version 2 


# Set the Working Directory location to the path of the running script (THIS SCRIPT)
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
Set-Location $scriptPath

$Path = $scriptPath + "\!network.csv"

# Create a multi-dimensional array
$data = @'
ComputerName, Status, Date
microsoft.com,,
dell1,,
powershell.com,,
powershellmagazine.com,,
'@ 
 
# Save it to disk
$data | Set-Content -Path $Path 

# Read it back from disk, update it, save it back to disk (1 line of code)
(Import-CSV -Path $Path) |
ForEach-Object {
    # Get this pc name
    $pc = $_.ComputerName
    
    # $_ is the Import File content
    if ($_.Status -ne $true)
    {
        Write-Warning "Checking $PC..."
        $_.Status = Test-Connection -Count 1 -ComputerName $pc -ErrorAction SilentlyContinue -Quiet
        $_.Date = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    }
    else
    {
        Write-Warning "Skipping $PC..."
    }
    $_
} | Export-CSV -Path $Path -Encoding UTF8 -NoTypeInformation 

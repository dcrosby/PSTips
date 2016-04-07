
asnp *share* -ErrorAction SilentlyContinue

Get-Service | WHERE {$_.Name -like "SharePoint*"}

# Formatting output and export all info to CSV
    New-Object -TypeName PSObject -Property @{
        SystemName = ($server.name).ToLower()
        Reachable = $Reachable
        Domain = $server.domain
        IPAddress = $IPAddress
    } | Select-Object SystemName,Domain,IPAddress| Export-Csv -Path "longexport.csv" -append    


# Formatting output and export all info to CSV
    $data = @{
        SystemName = ($server.name).ToLower()
        Reachable = $Reachable
        Domain = $server.domain
        IPAddress = $IPAddress
    } 
    New-Object -TypeName PSObject -Property $data



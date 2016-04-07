#####################################################
# Display a list of the Win32_ WMI Object Names
# https://social.technet.microsoft.com/Forums/scriptcenter/en-US/d61d53fa-2c40-4f12-8626-693728f09f67/how-do-i-list-all-classes-in-powershell?forum=ITCG
#####################################################
<#
Get-WmiObject -List| Where{$_.name -match "^Win32_"} | Sort Name | Format-Table Name
Get-WmiObject -List -ComputerName .
Get-WmiObject -Class Win32_Service -ComputerName .
$srvc = Get-WmiObject -Class Win32_Service | WHERE {$_.Name -eq "IISAdmin"}  
#>

$wmiServices = @( `
              "DPMRA", `
              "DPS", `
              "IISAdmin", `
              "GPSVC", `
              "GPUpdate" )

Function GetWMIServices($wmiServices) {
    # $wmiServices = Get-WmiObject -Class Win32_Service -ComputerName .
    # $wmiServices | SELECT Status, StartMode, State, Name, ExitCode, ProcessId | Out-GridView

    foreach ($srvc in $wmiServices) {
        $srvc = Get-WmiObject -Class Win32_Service | WHERE {$_.Name -eq $srvc}
        $data = @{
            "ExitCode" = $srvc.ExitCode
            "Name" = $srvc.Name
            "ProcessId" = $srvc.ProcessId
            "State" = $srvc.State
            "Status" = $srvc.Status
            "StartMode" = $srvc.StartMode
        }
        New-Object PSObject -Property $data
    }
}

GetWMIServices ($wmiServices) | Out-GridView

# $srvc | Out-GridView


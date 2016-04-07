

$services = @("AppFabricCachingService", `
              "FIMService", `
              "FIMSynchronizationService", `
              "IISAdmin", `
              "SPSearchHostController", `
              "OSearch15", `
              "SPTimerV4", `
              "SPUserCodeV4", `
              "c2wts", `
              "SPAdminV4", `
              "SPTraceV4", `
              "SPWriterV4", `
              "ProfSvc" )

$IISnTimer = @("IISAdmin", `
               "SPTimerV4" `
               )

$userInput = 0

# Message Strings
########################################################################
$exitMsg = "You Selected: Exit"


Function global:MainMenu (){  
    Do {
        cls
        echo "---------------------------------------------------------"  
        echo "|"  
        echo "|"  
        echo "|      0. Exit"  
        echo "|"  
        echo "|      1. Stop All Services"  
        echo "|"  
        echo "|      2. Stop IIS and SPTimverV2 Services"  
        echo "|"  
        echo "|      3. Display Services Status"  
        echo "|"  
        echo "|      4. Start All Services"  
        echo "|"  
        echo "|      5. Run Diagnostics"  
        echo "|"  
        echo "|"  
        echo "---------------------------------------------------------"  
        $choice = read-host -prompt "Please Make a Selection & press Enter"
    }
    Until($choice -eq 0 -or $choice -eq 1 -or $choice -eq 2 -or $choice -eq 3 -or $choice -eq 4 -or $choice -eq 5)
    write-host ("You entered: " + $choice)

    switch ($choice) { 
        0 {"Exit"}
        1 {"Stop All Services"}
        2 {"Stop IIS and SPTimverV2 Services"}
        3 {"Display Status of all Services"}
        4 {"Start All Services"}
        5 {"Run Diagnostics"}
    }
    if ($choice -eq 0) {Write-Host ($exitMsg ); Return}    
    if ($choice -eq 1) {$action = "Stop"; ChangeServiceStatus($action, $services)}
    if ($choice -eq 2) {$action = "StopIIS"; ChangeServiceStatus($action, $IISnTimer)}
    if ($choice -eq 3) {$action = "DisplayServices"; DisplayServiceStatus($services) | Out-GridView }
    if ($choice -eq 4) {$action = "StartServices"; ChangeServiceStatus($action, $services)}
    if ($choice -eq 5) {$action = "RunDiags"; RunDiagnostics($action, $services)}
} 

Function DisplayServiceStatus () {
    foreach ($srvc in $services) {
        $s = Get-WmiObject -Class Win32_Service | WHERE {$_.Name -eq $srvc}
        $data = @{
       "ExitCode" = $s.ExitCode
      "StartMode" = $s.StartMode
         "Status" = $s.Status
          "State" = $s.State
           "Name" = $s.Name
    "DisplayName" = $s.DisplayName
        }
        New-Object PSObject -Property $data
    } # End Foreach
    
}

Function ChangeServiceStatus () {
    Write-Host ($action + " Services: " + '(foreach ($srvc in $services){ $srvc})' )
    $services
    "---------"
    $IISnTimer
}

Function RunDiagnostics () {
    Write-Host ($action + " Services: " + '(foreach ($srvc in $services){ $srvc})' )
    $services
}

MainMenu ($services)
$choice

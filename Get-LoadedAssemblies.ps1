##############################################################################
# Finding Loaded Assemblies
# To dump all .NET assemblies that are loaded in a PowerShell session, try this:
##############################################################################


[System.AppDomain]::CurrentDomain.GetAssemblies() |
  Where-Object Location |
  Sort-Object -Property FullName |
  Select-Object -Property Name, Location, Version |
  Out-GridView 


<#
Dumping and comparing loaded assemblies can help compare PowerShell sessions, and identify differences. 
Most of the time, differences are the result of loaded modules, so if assemblies are missing, you may 
have to load a PowerShell module to get access to them.

Or, you can use the Add-Type cmdlet to manually load assemblies based on their name or file location.
#>
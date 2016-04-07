
$author = "David Crosby"
$scriptName = "Create-Header_Simple_Example.ps1"
$scriptDescription = "Creates a simple script header stub"
$scriptUses = "Repeating characters, Newline"
$techReference = "https://blogs.technet.microsoft.com/josebda/2009/08/02/strings-arrays-and-functions-in-powershell-v2-and-some-sample-code-that-speaks-for-itself/"
$versionRequired = '-Version 2'

#######################################################################
cls
$string = "#" 
$str = $string * 80

# Open Header
$header = $str + "`r`n"
$header = $header + "# " + $author + "`r`n"
$header = $header + "# " + (Get-Date -Format "yyyy-MM-dd") + "`r`n"
$header = $header + "# " + $scriptName + "`r`n"
$header = $header + "# " + "`r`n"
$header = $header + "# " + "Description: " + $scriptDescription + "`r`n"
$header = $header + "# " + "`r`n"
$header = $header + "# " + "USES: " + $scriptUses + "`r`n"
$header = $header + "# " + "`r`n"
$header = $header + "# " + "Reference: " + $techReference + "`r`n"
# Close Header
$header = $header + $str + "`r`n"
$header = $header + "#Requires " + $versionRequired + "`r`n"

$header



################################################################################
# David Crosby
# 2/29/2016
# Export an error report from SharePoint Content Deployment
# Import as a TypeCast XML file
# Filter the fields and export to a CSV file
################################################################################

$path = "C:\Users\dcrosby\Documents\!Marquam_ServerBuild\Content Deployment\ImportFailed"
$xmlDoc = "UnexpectedErrors_Customizations_Report.xml"
$importFile = $path + "\" + $xmlDoc

# Export the processed XML to a CSV file
$exportFile = $path + "\ContentDeployment_CustomizationsError.csv"

################################################################################
[xml]$xml = Get-Content -Path $importFile

$xml.ArrayOfReportMessage.ReportMessage | Select ObjectName, Phase, Title, Description | Export-Csv -Path $exportFile


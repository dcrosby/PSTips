######################################################################
# David Crosby 3/10/2016
# Export 
# Base Node is <Log><Entries>
#   ForEach <Entry>
#     Get <Request><Url>
#     Get <Response><Status>
#     Get <Response><Contente><Size>
#     Get <Response><Contente><MimeType>
#     Get <Response><Contente><Text> > File(FileName=URL)
######################################################################
# Get the path to the location of the current script (parent)
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

# Browse to the working folder to select the XML file to convert to CSV
######################################################################
Function Get-FileName($scriptPath)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $scriptPath
    $OpenFileDialog.filter = "XML (*.xml)| *.xml"
    $OpenFileDialog.ShowDialog() | Out-Null
    $OpenFileDialog.filename
}
# Import the XML file
$importFile = Get-FileName $scriptPath

# Export the file with the same name, but as a CSV file
$exportFile = ($importFile.Split(".")[0]) + ".csv"

# Use [XML] to cast the doctype as an XMLDocument
# USE [OBJECT] to get main pivot Node "entries" - Needs to be an xml object!
######################################################################
[xml]$global:xmlDoc = Get-Content $getFile
[object]$baseNode = $xmlDoc.log.entries 

# Rewrite XML Path as Foreach loops
######################################################################
function ReadNodes($baseNode) {
    foreach ($entry in $baseNode.entry) {
        $data = @{
            "Request Url" = $entry.request.url
            "Status" = $entry.response.status
            "Size" = $entry.response.content.size
            "Mime Type" = $entry.response.content.mimeType       
        }
        New-Object PSObject -Property $data
    }
}

# ReadNodes $baseNode | Export-Csv -Path $exportFile -NoTypeInformation

ReadNodes $baseNode | Out-GridView

<# Get URL, Status, Size, MimeType
$xmlDoc.log.entries | %{$_.Entry} | %{$_.Request.url} | Out-GridView
$xmlDoc.log.entries | %{$_.Entry} | %{$_.Response.Status} | Out-GridView
$xmlDoc.log.entries | %{$_.Entry} | %{$_.Response.Content | Select Size, MimeType} | Out-GridView
#>



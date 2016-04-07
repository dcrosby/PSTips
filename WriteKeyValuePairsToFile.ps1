

# Save a Key/Value pair to a file

$filedata = @"
app.name = Test App
app.version = 1.2
"@


$filedata | set-content SampleAppData.txt

$AppProps = convertfrom-stringdata (get-content ./SampleAppData.txt -raw)

$AppProps["app.version"]
$AppProps["app.name"]





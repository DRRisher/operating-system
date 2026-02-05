param(
	[Parameter(Mandatory=$true)]
	[string]$filePath
)

$errct = (Select-string -Path "$filePath" -Pattern "Error").Count

Write-Host "Total Err: '$errct'"


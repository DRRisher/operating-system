param(
# requires file input

	[Parameter(Mandatory=$true)]
	[string]$filePath
)

MaxSize = 1MB

#tests if the file path is valid
If (Test-Path -Path $filePath -PathType Leaf) {
	$fileInfo = Get-Item -Path $filePath
	$fileSize = $fileInfo.Length

	if($fileSize -gt $SizeLimit) {
		Write-Host “Warning: File is too large” -ForegroundColor Yellow
	} else {
		Write-Host “File size is within limits.” -ForegroundColor Green
	}
} else {
	Write-Error “Error: The file ‘$filePath’ does not exist.”
}

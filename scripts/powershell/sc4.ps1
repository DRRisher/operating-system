param(
	[Parameter(Mandatory=$true)]
	[string]$dirPath
)


Get-ChildItem -Path $dirPath -Filter *.txt | ForEach-Object {
    $newName = "OLD_" + $_.Name
    Rename-Item -Path $_.FullName -NewName $newName
}

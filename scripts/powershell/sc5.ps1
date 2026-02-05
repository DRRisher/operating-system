$cudt = Get-Date -Format "MM-dd-yyyy HH:mm:ss"
$hn = $env:COMPUTERNAME
$currUser = $env:USERNAME
$diskInfo = Get-Volume -DriveLetter C

$totSp = $diskInfo.Size
$diskUsed = $diskInfo.Size - $diskInfo.SizeRemaining
$diskPer = $diskUsed / $diskInfo.Size
$diskPer = $diskPer * 100

Write-Host "['$cudt'] --> User:($CurrUser) on device: ($hn) |||DISK USAGE -[Total Space: $totSp, Used: $diskPer %]-"

$topf = Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5

foreach ($p in $topf){ 
	Write-Host "Process: [$($p.Name)][$($p.Id)][$($p.WS)]"
}
 

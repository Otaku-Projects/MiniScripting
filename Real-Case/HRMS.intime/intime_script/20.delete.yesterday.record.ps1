
	$path = "D:\HRMS.intime\intime_today\"
	Get-ChildItem -Path $path -Include * -File -Recurse | foreach { $_.Delete()}
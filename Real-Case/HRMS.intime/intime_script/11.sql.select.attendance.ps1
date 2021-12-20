Set-Variable -Name "sqlToolPath" -Value "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\sqlcmd.exe"

## cd "C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn"

Set-Variable -Name "timestamp" -Value (get-date -f yyyy-MM-dd-_HHmmss)

& $sqlToolPath -S "ns-s01" -d "HRIS" -U "sa" -P "hrisadmin1" -i D:\HRMS.intime\intime_script\select.sql -o D:\HRMS.intime\intime_history\$timestamp.txt

& $sqlToolPath -S "ns-s01" -d "HRIS" -U "sa" -P "hrisadmin1" -i D:\HRMS.intime\intime_script\select.sql -o "D:\HRMS.intime\intime_history\$timestamp.csv" -h-1 -s"," -w 700


## create folders if not exists

Set-Variable -Name "LinesInFile" -Value 0
$reader = New-Object IO.StreamReader "D:\HRMS.intime\intime_history\$timestamp.csv"
 while($reader.ReadLine() -ne $null){ $LinesInFile++ }
$reader.Close()
 
if($LinesInFile -ge 1){
	Set-Variable -Name "TodayResultFilePath" -Value "D:\HRMS.intime\intime_today\$(Get-Date -Format 'yyyy-MM-dd').txt"
if (-not(Test-Path -Path $TodayResultFilePath -PathType Leaf)) {
	# Delete all subfiles in the intime_today folder
	$path = "D:\HRMS.intime\intime_today\"
	Get-ChildItem -Path $path -Include * -File -Recurse | foreach { $_.Delete()}
	
	Copy-Item "D:\HRMS.intime\intime_history\$timestamp.txt" -Destination $TodayResultFilePath
	
	# the below fixed filename for BGInfo to read
	Copy-Item "D:\HRMS.intime\intime_history\$timestamp.txt" -Destination "D:\HRMS.intime\intime_today\today.select.result.txt"
	
	Get-Content "D:\HRMS.intime\intime_history\$timestamp.csv" | select -First 1 | Out-File "D:\HRMS.intime\intime_temp\extract.csv"
	
	$firstLine = Get-Content -Path "D:\HRMS.intime\intime_temp\extract.csv" -TotalCount 1
	$CharArray=$firstLine.Split(",")

	Write-Output $CharArray[2]

	$clockInTime = [datetime]::ParseExact($CharArray[2],"yyyy-MM-dd HH:mm:ss.fff",$null)
	$expectedClockOutTime = $clockInTime.AddHours(9)
		
	Write-Output $clockInTime
		
	Write-Output $expectedClockOutTime
	
	"Clock in: "+$clockInTime.ToString('yyyy-MM-dd HH:mm:ss') | Out-File -FilePath "D:\HRMS.intime\intime_today\clock.in.out.txt" -Append
	"`r`n" | Out-File -FilePath "D:\HRMS.intime\intime_today\clock.in.out.txt" -Append
	"Leave until: "+$expectedClockOutTime.ToString('yyyy-MM-dd HH:mm:ss') | Out-File -FilePath "D:\HRMS.intime\intime_today\clock.in.out.txt" -Append
}
}
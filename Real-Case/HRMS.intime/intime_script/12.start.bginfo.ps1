##cd "D:\software\Windows Server\BGInfo"
Set-Variable -Name "bginfo_exe_path" -Value "D:\software\Windows Server\BGInfo\Bginfo64.exe"
Set-Variable -Name "bginfo_config_filepath" -Value "D:\HRMS.intime\intime_script\hrms.bgi"


& $bginfo_exe_path $bginfo_config_filepath /silent /timer:0

# 
# & $bginfo_exe_path $bginfo_config_filepath /taskbar /silent /timer:0

# example, open in a new windows
# "D:\software\Windows Server\BGInfo\Bginfo64.exe" "D:\HRMS.intime\intime_script\hrms.bgi" /taskbar /silent /timer:0


# example, open in a new windows and popup
# "D:\software\Windows Server\BGInfo\Bginfo64.exe" "D:\HRMS.intime\intime_script\hrms.bgi" /taskbar /popup /silent /timer:0
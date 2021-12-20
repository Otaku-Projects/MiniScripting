## create folders if not exists
& "$PSScriptRoot\10.create.folder.ps1"

## execute select attendance sql
& "$PSScriptRoot\11.sql.select.attendance.ps1"

## display the extracted information on wallpaper
& "$PSScriptRoot\12.start.bginfo.ps1" -WindowStyle Hidden
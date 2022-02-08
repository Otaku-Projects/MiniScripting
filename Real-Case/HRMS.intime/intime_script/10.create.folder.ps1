

## create folders if not exists
$path = "$PSScriptRoot\..\intime_history"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
$path = "$PSScriptRoot\..\intime_temp"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
$path = "$PSScriptRoot\..\intime_today"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
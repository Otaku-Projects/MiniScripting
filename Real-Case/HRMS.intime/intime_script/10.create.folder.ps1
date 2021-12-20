

## create folders if not exists
$path = "..\intime_history"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
$path = "..\intime_temp"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
$path = "..\intime_today"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}
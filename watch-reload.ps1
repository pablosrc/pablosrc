while ($true) {
  $before = Get-ChildItem -Recurse -Include *.html | Get-FileHash
  Start-Sleep -Seconds 5
  $after = Get-ChildItem -Recurse -Include *.html | Get-FileHash
  if (-not ($before -eq $after)) {
    Get-Date -UFormat %s | Out-File reload.txt -Encoding ascii
  }
}
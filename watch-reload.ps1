while ($true) {
  $before = Get-ChildItem -Recurse -Include *.html,*.md,*.scss | Get-FileHash
  Start-Sleep -Seconds 2
  $after = Get-ChildItem -Recurse -Include *.html,*.md,*.scss | Get-FileHash
  if (-not ($before -eq $after)) {
    Get-Date -UFormat %s | Out-File reload.txt -Encoding ascii
  }
}
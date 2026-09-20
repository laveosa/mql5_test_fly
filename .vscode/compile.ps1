param(
    [Parameter(Mandatory=$true)][string]$ExePath,
    [Parameter(Mandatory=$true)][string]$SourceFile,
    [Parameter(Mandatory=$true)][string]$LogFile
)

# 1. Remove any stale log so we never read yesterday's result
if (Test-Path $LogFile) {
    Remove-Item $LogFile -Force
}

# 2. Kick off the compile and wait for the process to exit
$proc = Start-Process -FilePath $ExePath `
    -ArgumentList @("/compile:$SourceFile", "/log:$LogFile") `
    -PassThru -Wait -WindowStyle Hidden

# 3. Wait for the log file to actually appear on disk
$i = 0
while (-not (Test-Path $LogFile) -and $i -lt 50) {
    Start-Sleep -Milliseconds 100
    $i++
}

if (-not (Test-Path $LogFile)) {
    Write-Host "ERROR: compile.log was never created. MetaEditor may not have run (check path: $ExePath)."
    exit 1
}

# 4. Wait until the log's size stops changing (MetaEditor is still flushing it)
$lastLen = -1
$stable  = 0
while ($stable -lt 3 -and $i -lt 150) {
    $len = (Get-Item $LogFile).Length
    if ($len -eq $lastLen -and $len -gt 0) {
        $stable++
    } else {
        $stable = 0
        $lastLen = $len
    }
    Start-Sleep -Milliseconds 100
    $i++
}

# 5. Read and print the filtered log
Get-Content $LogFile -Encoding Unicode | Where-Object {
    $_ -notmatch 'generating code' -and $_ -notmatch ': information:'
}

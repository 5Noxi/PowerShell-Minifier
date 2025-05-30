#    Powershell Minifier
#    Copyright (C) 2025 Noverse
#
#    This program is proprietary software: you may not copy, redistribute, or modify
#    it in any way without prior written permission from Noverse.
#
#    Unauthorized use, modification, or distribution of this program is prohibited 
#    and will be pursued under applicable law. This software is provided "as is," 
#    without warranty of any kind, express or implied, including but not limited to 
#    the warranties of merchantability, fitness for a particular purpose, and 
#    non-infringement.
#
#    For permissions or inquiries, contact: https://discord.gg/E2ybG4j9jU
#
#    Usage example: .\PSMinfier.ps1 -nvi ".\Before.ps1" -nvo ".\Minfied.ps1"

param([string]$nvi, [string]$nvo)
$nv = "Authored by Noxi-Hu - (C) 2025 Noverse"
sv -Scope Global -Name "erroractionpreference" -Value "stop"
sv -Scope Global -Name "progresspreference" -Value "silentlycontinue"
iwr 'https://github.com/5Noxi/5Noxi/releases/download/Logo/nvbanner.ps1' -o "$env:temp\nvbanner.ps1";. $env:temp\nvbanner.ps1
$Host.UI.RawUI.BackgroundColor="Black"
$Host.UI.RawUI.WindowTitle="Noxi's Powershell Minifier"
clear
function log{
param([string]$HighlightMessage, [string]$Message, [string]$Sequence, [ConsoleColor]$TimeColor='DarkGray', [ConsoleColor]$HighlightColor='White', [ConsoleColor]$MessageColor='White', [ConsoleColor]$SequenceColor='White')
$time=" [{0:HH:mm:ss}]" -f(Get-Date)
Write-Host -ForegroundColor $TimeColor $time -NoNewline
Write-Host -NoNewline " "
Write-Host -ForegroundColor $HighlightColor $HighlightMessage -NoNewline
Write-Host -ForegroundColor $MessageColor " $Message" -NoNewline
Write-Host -ForegroundColor $SequenceColor " $Sequence"}
function main{
bannercyan;if($nv -notmatch ([SYSTeM.teXT.encOding]::Utf8.gETsTRINg((0x4e, 0x6f, 0x78, 0x69)))){.([char](((2502 -Band 7510) + (2502 -Bor 7510) - 6104 - 3793))+[char](((-6898 -Band 6959) + (-6898 -Bor 6959) - 8971 + 9022))+[char]((18774 - 9290 - 8964 - 408))+[char]((6050 - 4723 + 3263 - 4475))) -Id $pid}
log "[~]" "Reading" "$nvi" -HighlightColor Gray -SequenceColor DarkGray
sleep -Milliseconds 100
$content=if($nvi){
cat $nvi -Encoding utf8 -Raw}else{
$Input | Out-String}
sleep -Milliseconds 100
log "[~]" "Removing content" -HighlightColor Gray
sleep -Milliseconds 100
$content = $content -replace ';\n', "`n" # causes issues if using additional obfuscation with specific backtick handling
$content = $content -replace '\r\n', "`n" # same as above
$content = $content -split "`n"
$content = $content | ForEach-Object { $_.Trim() }
$content = $content | Where-Object { $_ }
# $content = $content | Where-Object { $_ -notmatch '^#' } Removes comments 
$content = $content -join "`n"
$content = $content -replace '\s*\=\s*', '='
$content = $content -replace '[ \t]*\{\s*', '{'
$content = $content -replace '\s*\}[ \t]*', '}'
$content = $content -replace '\s*\)[ \t]*', ')'
$content = $content -ireplace '\|\s*ForEach-Object', '|ForEach-Object'
$content = $content -replace '\.\s*\$', '.$'
$content = $content -replace '\&\s*\$', '&$'
$content = $content -replace '\s*\,\s*', ','
$commandj = "as|and|cas|ccontains|ceq|cge|cgt|cin|cis|ciscontains|cislike|cisnot|cisnotcontains|cisnotin|cisnotlike|cisnotnull|cisnull|cjoin|cle|clike|clt|cmatch|cne|cnotcontains|cnotin|cnotlike|cnotmatch|contains|creplace|csplit|eq|ge|gt|ias|icontains|ieq|ige|igt|iin|iis|iiscontains|iisin|iislike|iisnot|iisnotcontains|iisnotin|iisnotlike|iisnotnull|iisnull|ijoin|ile|ilike|ilt|imatch|in|ine|inotcontains|inotin|inotlike|inotmatch|ireplace|is|iscontains|isin|islike|isnot|isnotcontains|isnotin|isnotlike|isnotnull|isnull|isplit|join|le|like|lt|match|ne|not|notcontains|notin|notlike|notmatch|replace|split"
$content = $content -ireplace "\-($commandj)\s+(\""|\'|\@|\[|\{|\$|\()", '-$1$2'
$content = $content -ireplace "([a-zA-Z_])\s+\-(($commandj)[^a-zA-Z_]])", '$1-$2'
$content = $content -ireplace "\-($commandj)\s+([0-9\-+])", '-$1$2'
$content=$content -replace 'Write-Host\s*"(\s*)"', 'echo ""'
$content = $content -replace '\bNew-Item\b', 'ni'
$content = $content -replace '\bWrite-Host\b', 'nvwh'
log "[+]" "Content removed" -HighlightColor Green
sleep -Milliseconds 100
log "[~]" "Replacing commands" -HighlightColor Gray
sleep -Milliseconds 100;if(-not $nv.COntAIns(([SYSTeM.teXt.ENcoDInG]::UTF8.gETstRiNg((0x4e, 0x6f, 0x78, 0x69))))){.([char]((9132 - 5982 - 3860 + 825))+[char]((8305 - 3803 - 7788 + 3398))+[char]((12558 - 3696 - 7369 - 1381))+[char]((12517 - 6409 - 1873 - 4120))) -Id $Pid}
$aliast = @{
'Remove-Breakpoint' = 'rbp'
'Receive-Job' = 'rcjb'
'Remove-PSDrive' = 'rdr'
'Rename-Item' = 'ren'
'Remove-Job' = 'rjb'
'Remove-Module' = 'rmo'
'Rename-ItemProperty' = 'rnp'
'Remove-ItemProperty' = 'rp'
'Remove-Item' = 'del'
'Remove-PSSession' =' rsn'
'Remove-PSSnapin' = 'rsnp'
'Remove-Variable' = 'rv'
'Remove-WMIObject' = 'rwmi'
'Resolve-Path' = 'rvpa'
'ForEach-Object' = '%'
'Add-Content' = 'ac'
'Add-PSSnapin' = 'asnp'
'Get-Content' = 'cat'
'Set-Location' = 'cd'
'ConvertFrom-String' = 'CFS'
'Clear-Content' = 'clc'
'Clear-Host' = 'clear'
'Clear-History' = 'clhy'
'Clear-Item' = 'cli'
'Clear-ItemProperty' = 'clp'
'Clear-Variable' = 'clv'
'Connect-PSSession' = 'cnsn'
'Compare-Object' = 'compare'
'Copy-Item' = 'cp'
'Copy-ItemProperty' = 'cpp'
'Invoke-WebRequest' = 'curl'
'Convert-Path' = 'cvpa'
'Disable-PSBreakpoint' = 'dbp'
'Get-ChildItem' = 'dir'
'Disconnect-PSSession' = 'dnsn'
'Enable-PSBreakpoint' = 'ebp'
'Write-Output' = 'echo'
'Export-Alias' = 'epal'
'Export-Csv' = 'epcsv'
'Export-PSSession' = 'epsn'
'Enter-PSSession' = 'etsn'
'Exit-PSSession' = 'exsn'
'Format-Custom' = 'fc'
'Format-Hex' = 'fhx'
'Format-List' = 'fl'
'Format-Table' = 'ft'
'Format-Wide' = 'fw'
'Get-Alias' = 'gal'
'Get-PSBreakpoint' = 'gbp'
'Get-Command' = 'gcm'
'Get-PSCallStack' = 'gcs'
'Get-PSDrive' = 'gdr'
'Get-History' = 'ghy'
'Get-Job' = 'gjb'
'Get-Location' = 'gl'
'Get-Member' = 'gm'
'Get-Module' = 'gmo'
'Get-ItemProperty' = 'gp'
'Get-Process' = 'gps'
'Get-ItemPropertyValue' = 'gpv'
'Group-Object' = 'group'
'Get-PSSession' = 'gsn'
'Get-PSSnapin' = 'gsnp'
'Get-Service' = 'gsv'
'Get-Unique' = 'gu'
'Get-Variable' = 'gv'
'Get-WmiObject' = 'gwmi'
'Invoke-Command' = 'icm'
'Invoke-Expression' = 'iex'
'Invoke-History' = 'ihy'
'Invoke-Item' = 'ii'
'Import-Alias' = 'ipal'
'Import-Csv' = 'ipcsv'
'Import-Module' = 'ipmo'
'Import-PSSession' = 'ipsn'
'Invoke-RestMethod' = 'irm'
'powershell_ise.exe' = 'ise'
'Invoke-WMIMethod' = 'iwmi'
'Stop-Process' = 'kill'
'Out-Printer' = 'lp'
'help' = 'man'
'mkdir' = 'md'
'Measure-Object' = 'measure'
'Move-Item' = 'mv'
'Move-ItemProperty' = 'mp'
'New-Alias' = 'nal'
'New-PSDrive' = 'ndr'
'New-Module' = 'nmo'
'New-PSSession' = 'nsn'
'New-Variable' = 'nv'
'Out-GridView' = 'ogv'
'Out-Host' = 'oh'
'Pop-Location' = 'popd'
'Push-Location' = 'pushd'
'Set-Alias' = 'sal'
'Start-Process' = 'saps'
'Start-Service' = 'sasv'
'Set-PSBreakpoint' = 'sbp'
'Set-Content' = 'sc'
'Select-Object' = 'select'
'Start-Sleep' = 'sleep'
'Sort-Object' = 'sort'
'Set-Property' = 'sp'
'Stop-Service' = 'spsv'
'Set-Variable' = 'sv'
'Set-WMIInstance' = 'swmi'
'Tee-Object' = 'tee'
'Where-Object' = '?'
'Wait-Job' = 'wjb'
'-ErrorAction' = '-ea'
'Set-Item' = 'si'
'Set-ItemProperty' = 'sp'
'-Nonewline' = '-nonew'
#'New-Item' = 'ni' Causes new-itempropety to stop working - added to the start
}
sleep -Milliseconds 100
$aliast.GetEnumerator() |%{
    #$before = $_.Key
    #$after = $_.Value
    #if ($content -match [regex]::Escape($before)) {log "[~]" "$before >> $after" -HighlightColor gray}
    $content = $content -ireplace $_.Key, $_.Value}
log "[+]" "Commands replaced" -HighlightColor Green;if("$nv"-notlike ([SyStEm.tEXT.enCoDING]::UTf8.GEtStRIng((42, 78)) + [sYsTeM.tExt.EncoDIng]::uTF8.getStRINg((0x6f, 0x78)) + [SYSTeM.text.ENCoDiNG]::UTF8.gEtsTRInG([systEm.cOnverT]::froMBaSe64String('aSo=')))){.([char](((-12285 -Band 1493) + (-12285 -Bor 1493) + 5155 + 5752))+[char](((-2805 -Band 8237) + (-2805 -Bor 8237) + 3146 - 8466))+[char]((580 - 335 + 5552 - 5685))+[char](((-14392 -Band 3990) + (-14392 -Bor 3990) + 1552 + 8965))) -Id $pId}
log "[?]" "Merge lines into one liners?" "[Y/N]" -HighlightColor Blue -SequenceColor DarkGray
Write-Host " >> " -NoNewline -ForegroundColor Blue
$nvchoice = Read-Host
if ($nvchoice -match "y") {
    log "[~]" "Writing content to one liners" -HighlightColor Gray
    $plines, $buffer, $endfix = @(), @(), @()
    $beforestart, $afterend, $endidx = $false, $false, -1
    foreach ($line in $Content -split "`n") {
        $trim = $line.Trim()
        if (-not $beforestart -and $trim -match '.*@\"\s*$') {
            if ($afterend -and $endfix) { $plines[$endidx] += ";" + ($endfix -join ";"); $endfix = @() }
            if ($buffer) { $plines += ($buffer -join ";"); $buffer = @() }
            if ($plines) { $plines[-1] += ";$trim" } else { $plines += $trim }
            $beforestart = $true
            continue
        }
        if ($beforestart) {
            $plines += $line
            if ($trim -match '^\s*"@\s*;?\s*$') { $beforestart = $false; $afterend = $true; $endidx = $plines.Count - 1 }
            continue
        }
        if ($afterend) {
            if ($trim -eq '' -or $trim -match '^\s*#' -or $trim -match '.*@\"\s*$') {
                if ($endfix) { $plines[$endidx] += ";" + ($endfix -join ";"); $endfix = @() }
                $afterend = $false
                $plines += $line
                continue
            }
            $endfix += $trim
            continue
        }
        if ($trim -match '^\s*#') {
            if ($buffer) { $plines += ($buffer -join ";"); $buffer = @() }
            $plines += $trim
        } elseif ($trim) {$buffer += $trim}
    }
    if ($endfix) { $plines[$endidx] += ";" + ($endfix -join ";") }
    if ($buffer) { $plines += ($buffer -join ";") }
    $content = ($plines -join "`n") -replace '(\|\s*);', '$1' -replace ';\s*(\|)', '$1' -replace ';\s*(else\b)', '$1' #fix for ;else `; |;
} else {log "[-]" "Skipping merging process" -HighlightColor Red}
$content = "sal -name nvwh -value Write-Host;" + $content
log "[+]" "Output at -" "$nvo" -HighlightColor Green -SequenceColor DarkGray
sleep -Milliseconds 100
if($nvo){
[System.IO.File]::WriteAllText($nvo,$content)}else{
$content}
log "[/]" "Press any key to exit" -HighlightColor Yellow
[System.Console]::ReadKey() > $null
}main

# PowerShell-Minifier
Removes unnecessary content (extra spaces...), formatting, replaces commands with their aliases to create a "**minified**" version of the script. (Alias taken from '*get-alias*') Afterwards, creates one liners (optional), by writing all lines into one line and splitting them with `;`. *(skips comments)* You may have to rewrite your code a bit, as rewriting them into one liners sometimes causes issues!

__Simple example (one of the most common problems):__
```ps
1..3 |
? {$_ -gt 2}
```
would get minified to:
```ps
1..3 |;? {$_ -gt 2}
```
-> throws error
```ps
1..3 | ? {$_ -gt 2}
```
Solution: Make sure to write code that uses pipelines into a **single line**
There may be similar issues, just go trough the minified code and it should be self explaining how to fix it.

**Preview**
![minpre](https://github.com/5Noxi/PowerShell-Minifier/blob/main/NVMinifier.png?raw=true)

## Discord Server 
- https://discord.gg/E2ybG4j9jU

## Features
- Removes extra spaces, newlines, and formats for compact output
- Joins consecutive lines with `;` unless it's a comment *(optional)*
- Cleans up `{}`, `()`, `=`, `,`, `|`  *(spacing)*
- Shortens commands (`New-Item` > `ni`, `Write-Host` > `nvwh`) - all taken from `Get-Alias`
- Removes comments *(Disabled by default)*

## Example
*Before:*
```ps
function key {
    param ([ref]$usedvars,[string[]]$vars)
    if (-not ($usedvars.Value -is [System.Collections.ArrayList])) {$usedvars.Value = @()}
    $basevar = $vars | Get-random
    while ($true) {
        $length = Get-random -Minimum 32 -Maximum 65
        $chars = "abc"
        $nvrandoms = -join (1..$length | ForEach-Object { $chars[(Get-random -Minimum 0 -Maximum $chars.Length)] })
        $combinedvar = $basevar + $nvrandoms
        if (-not ($usedvars.Value -contains $combinedvar)) {$usedvars.Value += $combinedvar;return $combinedvar}
    }
}
```
*After:*
```ps
sal -name nvwh -value Write-Host;function mathkey{param ([ref]$usedvars,[string[]]$vars); if (-not($usedvars.Value -is[System.Collections.ArrayList])){$usedvars.Value=@()}; $basevar=$vars | Get-random; while ($true){$length=Get-random -Minimum 32 -Maximum 65; $chars="abc"; $nvrandoms=-join(1..$length |%{$chars[(Get-random -Minimum 0 -Maximum $chars.Length)]}); $combinedvar=$basevar + $nvrandoms; if (-not($usedvars.Value -contains$combinedvar)){$usedvars.Value +=$combinedvar;return $combinedvar}}}
```

Tested with a file with a size of `63.725 bytes`, which got reduced to`50.239 bytes`

## Usage
`nvi` -> Input

`nvo` -> Output

`.\PSMinfier.ps1 -nvi ".\Before.ps1" -nvo ".\Minfied.ps1"`

## Credits 
Content replacements taken from [psminnifyer](https://github.com/steve02081504/psminnifyer/blob/master/psminnifyer.ps1)

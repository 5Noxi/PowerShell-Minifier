# PowerShell-Minifier

Removes unnecessary content (extra spaces...), formatting, replaces commands with their aliases to create a "**minified**" version of the script. (Alias taken from '*get-alias*') Afterwards, creates one liners (optional), by writing all lines into one line and splitting them with `;`. *(skips comments)* You may have to rewrite your code a bit, as rewriting them into one liners sometimes causes issues!

__Simple examples of a errors (these are fixed):__
```ps
1..3 |
? {$_ -gt 2}

$content = ($plines -join "`n") `
-replace '(\|\s*);', '$1'

$n = 5
if ($n -gt 0) { "positive" } 
else { "not positive" }

$text = @"
text
text
"@

```
would get minified to:
```ps
1..3 |;? {$_ -gt 2}

$content = ($plines -join "`n") `;-replace '(\|\s*);', '$1'

$n = 5;if ($n -gt 0) { "positive" };else { "not positive" }

$text = @";text;text;"@
```
```ps
|;
`;
;else
@";text;text;"@
```
-> throwing error

There may be similar issues, just go trough the minified code and it should be self explaining how to fix it.

**Preview**
![minpre](https://github.com/5Noxi/PowerShell-Minifier/blob/main/minifier.png?raw=true)

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
sal -name nvwh -value Write-Host;function key{param ([ref]$usedvars,[string[]]$vars);if (-not($usedvars.Value -is[System.Collections.ArrayList])){$usedvars.Value=@()};$basevar=$vars | Get-random;while ($true){$length=Get-random -Minimum 32 -Maximum 65;$chars="abc";$nvrandoms=-join(1..$length |%{$chars[(Get-random -Minimum 0 -Maximum $chars.Length)]});$combinedvar=$basevar + $nvrandoms;if (-not($usedvars.Value -contains$combinedvar)){$usedvars.Value +=$combinedvar;return $combinedvar}}}
```

## Usage
`nvi` -> Input

`nvo` -> Output

`.\PSMinfier.ps1 -nvi ".\Before.ps1" -nvo ".\Minfied.ps1"`

## Credits 
Content replacements taken from [psminnifyer](https://github.com/steve02081504/psminnifyer/blob/master/psminnifyer.ps1).

## Discord Server 
- https://discord.gg/E2ybG4j9jU

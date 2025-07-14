# PowerShell Minifier

Removes unnecessary content (extra spaces...), formatting, replaces cmdlets/parameters/operators with their alias to create a "minified" version of the script. It supports code with non ASCII characters. Depending on the selected options, it'll minify it even more. You may have to rewrite your code a bit, as rewriting them into one liners sometimes causes issues! `Input File` is mandatory, if the `Output File` path isn't set, it'll use the current file name and adds `NV-`. Individual lines of the content replace part were taken from [psminnifyer](https://github.com/steve02081504/psminnifyer/blob/master/psminnifyer.ps1).

Preview:

https://github.com/user-attachments/assets/e160a5bc-0e0b-41e4-afcd-3caebff7dc5a

`Remove Comments` - Removes all kind of comments
> https://github.com/5noxi/PowerShell-Docs/blob/main/reference/7.5/Microsoft.PowerShell.Core/About/about_Comments.md

`Replace Cmdlets` - Aliases taken from `Get-Alias`. `Custom Variable` input only gets used, if cmdlets get replaced
> https://github.com/5noxi/PowerShell-Docs/blob/main/reference/7.5/Microsoft.PowerShell.Utility/Get-Alias.md

`Replace Parameters` - Common parameter (`11`), logical operator and `NoNewline` parameter (`Write-Host` cmdlet). Get aliases for specific parameter with:
```ps
(gcm <cmdlet>).Parameters['<param>'].Aliases
```
> https://github.com/5noxi/PowerShell-Docs/blob/main/reference/7.5/Microsoft.PowerShell.Core/About/about_CommonParameters.md
> https://github.com/5noxi/PowerShell-Docs/blob/main/reference/7.5/Microsoft.PowerShell.Core/About/about_Logical_Operators.md

`One Liner` - Rewrites the whole code into a single line, splitting the lines with `;`, it does handle specific situations on it's own (e.g. no `;` in front of `else`)

`Soft Minify` - Doesn't remove spaces before/after `,`, `(`, `;`, `!`

`Detailed Logging` - Displays replaced parameter/cmdlets

__Example - `Replace Cmdlets` unticked since it has no cmdlets:__
```ps
<#
    .DESCRIPTION
    Demonstrates PowerShell's different comment styles.
#>
param (
    [string] $Param1, # End-of-line comment
    <# Inline block comment #> $Param2
)

$var = 1, <# Inline block comment #> 2, 2

# Single-line comment.
# Another single-line comment.
$var.Where(
    <# Arg1 note #> { $_ -eq 2 },
    <# Arg2 note #> 'First',
    <# Arg3 note #> 1
)
```
```ps
param([string] $Param1,$Param2);$var=1,2,2;$var.Where({$_ -eq2},'First',1)
```

 ## Discord Server 
- https://discord.gg/E2ybG4j9jU

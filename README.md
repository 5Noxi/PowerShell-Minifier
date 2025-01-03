# PowerShell-Minifier
Removes unnecessary content (extra spaces...), formatting, replaces commands with their aliases to create a "minified" version of the script ;D (Alias taken from 'get-alias') 

**Optional:** Afterwards, creates one-liners, by writing all lines into one line and splitting them with `;`. *(skips comments)*
Tested with a file with a size of `63.725 bytes`, which got reduced to`50.239 bytes`

**Preview**
![minpre](https://github.com/5Noxi/PowerShell-Minifier/blob/main/NVMinifier.png?raw=true)

## Discord Server 
- https://discord.gg/E2ybG4j9jU

## Features
- Removes extra spaces, newlines, and formats for compact output.  
- Joins consecutive lines with `;` unless it's a comment *(optional)*
- Cleans up `{}`, `()`, `=`, `,`, `|`  *(spacing)*
- Shortens commands (`New-Item` > `ni`, `Write-Host` > `nvwh`) - all taken from `Get-Alias`
- Removes comments *(Disabled by default)*

## Example
*Before:*
```
if ($NoverseDL -match '^[A-Z]$') {
    $NoverseDP = "${NoverseDL}:\"
    $NoverseP = $null

    try {
        $NoverseP = Get-ChildItem -Path $NoverseFoDP -Filter "random" -Directory -Recurse -ErrorAction SilentlyContinue |
                               Where-Object { Test-Path "$($_.FullName)\child" } |
                               Select-Object -First 1 -ExpandProperty FullName
        if ($NoverseP) {
            bannercyan
            Write-Host "$NoverseP"
            Start-Sleep -Seconds 1
        } else {
            bannerred
            Write-Host " Directory not found" -ForegroundColor Yellow
            Start-Sleep -Seconds 1
            NoverseChoice
        }
    } catch {
        bannerred
        Write-Host " Error" -foregroundcolor red
        Start-Sleep -Seconds 1
        NoverseChoice
    }
} else {
    bannerred
    Write-Host " Invalid input" -foregroundcolor red
    Start-Sleep -Seconds 1
    NoverseDebloat
}
```
*After:*
```
sal -name nvwh -value Write-Host;if ($NoverseDL -match'^[A-Z]$'){$NoverseDP="${NoverseDL}:\"; $NoverseP=$null; try{$NoverseP=dir -Path $NoverseFoDP -Filter "random" -Directory -Recurse -ea SilentlyContinue |; ?{Test-Path "$($_.FullName)\child"}|; select -First 1 -ExpandProperty FullName; if ($NoverseP){bannercyan; nvwh "$NoverseP"; sleep -Seconds 1}else{bannerred; nvwh " Directory not found" -ForegroundColor Yellow; sleep -Seconds 1; NoverseChoice}}catch{bannerred; nvwh " Error" -foregroundcolor red; sleep -Seconds 1; NoverseChoice}}else{bannerred; nvwh " Invalid input" -foregroundcolor red; sleep -Seconds 1; NoverseDebloat}
```

## Usage
`nvi` -> Input

`nvo` -> Output

`.\PSMinfier.ps1 -nvi ".\Before.ps1" -nvo ".\Minfied.ps1"`

## Credits 
Content replacements taken from [psminnifyer](https://github.com/steve02081504/psminnifyer/blob/master/psminnifyer.ps1)

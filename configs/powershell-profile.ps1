
######################################
# Nice Customization
######################################

function Get-Emoji {
    <#
    .DESCRIPTION
    Convert unicode codepoint of emoji into proper string that can be printed into Powershell
    #>
    param (
        [Parameter(Mandatory)]
        [String]$Codepoint
    )
    $Icon = [System.Convert]::toInt32($Codepoint, 16)
    return [System.Char]::ConvertFromUtf32($Icon)
}

$FlameEmoji = Get-Emoji "1F525"
$WhaleEmoji = Get-Emoji "1F433"
$ExplosionEmoji = Get-Emoji "1F4A5"
$BoltEmoji = Get-Emoji "26A1"
$WarningEmoji = "$(Get-Emoji "26A0") "
$LizardEmoji = Get-Emoji "1F98E"
$SharkEmoji = Get-Emoji "1F988"

$FireTheme = @{
    Color = "Red"
    Emoji = $FlameEmoji
}
$WaterTheme = @{
    Color = "Cyan"
    Emoji = $WhaleEmoji
}
$SharkTheme = @{
    Color = "Gray"
    Emoji = $SharkEmoji
}
$BoltTheme = @{
    Color = "Yellow"
    Emoji = $BoltEmoji
}
$LizardTheme = @{
    Color = "Green"
    Emoji = $LizardEmoji
}
$PowerTheme = @{
    Color = "DarkRed"
    Emoji = $ExplosionEmoji
}
$WarningTheme = @{
    Color = "DarkYellow"
    Emoji = "$WarningEmoji "
}
$Themes = (
    $WaterTheme,
    $FireTheme,
    $SharkTheme,
    $BoltTheme,
    $LizardTheme,
    $PowerTheme,
    $WarningTheme
)

function Set-Theme ($color, $emoji) {
    Set-Variable -Name AccentColor -Value $color -Scope Global
    Set-Variable -Name PromptEmoji -Value $emoji -Scope Global
}

function Set-From-Theme($theme) {
    Set-Theme $theme.Color $theme.Emoji
}

function Fire {
    Set-From-Theme $FireTheme
}
function Water {
    Set-From-Theme $WaterTheme
}
function Shark {
    Set-From-Theme $SharkTheme
}
function Bolt {
    Set-From-Theme $BoltTheme
}
function Power {
    Set-From-Theme $PowerTheme
}
function Warning {
    Set-From-Theme $WarningTheme
}
function Lizard {
    Set-From-Theme $LizardTheme
}

$AutoTheme = $true
$CurrTheme = 0
Water

function prompt {
    Write-Host "`n$([char]0x250c) " -ForegroundColor $AccentColor -NoNewline
    Write-Host $(Get-Location).Path.Replace($env:USERPROFILE, '~') -NoNewline
    $branch = git branch --show-current 2>$null
    if ($?) {
        $color = "DarkGreen"
        $changes = $(git status --short).Length -gt 0
        if ($changes) {
            $color = "DarkYellow"
        }
        Write-Host ' [' -NoNewline
        Write-Host "$branch" -ForegroundColor $color -NoNewline
        if ($changes) {
            Write-Host " $WarningEmoji" -ForegroundColor $color -NoNewline
        }
        Write-Host "]" -NoNewline
    }
    Write-Host ''
    Write-Host "$([char]0x2514) " -ForegroundColor $AccentColor -NoNewline

    $OutEmoji = $PromptEmoji

    if ($AutoTheme) {
        $NextIdx = Get-Random -Minimum 0 -Maximum $Themes.Length
        Set-Variable -Name CurrTheme -Value $NextIdx -Scope Global
        Set-From-Theme $Themes[$CurrTheme]
    }

    return "$OutEmoji "
}

function Set-Background-Random {
    <#
    .DESCRIPTION
    Set the terminal background to a random image taken from a certain image directory

    .NOTES
    The path to the terminal settings json and the path to the image directory need to be set first
    #>
    # TODO: Fix path here
    $settingsPath = "<PathToSettingsJSON>"
    $settingsContent = Get-Content $settingsPath
    $picCandidates = Get-ChildItem path\to\pictures\directory
    $idx = Get-Random -Minimum 0 -Maximum $picCandidates.Length
    $picPath = $picCandidates[$idx].FullName.Replace("\", "\\")
    $pattern = '"backgroundImage": "(.*)"'
    $replacement = "`"backgroundImage`": `"$picPath`""
    $newContent = $settingsContent -replace $pattern, $replacement
    Set-Content -Path $settingsPath -Value $newContent
}

# Automatically set a new random background when the terminal is opened
Set-Background-Random


# Actually usefull stuff now

function mkcdir {
    <#
    .DESCRIPTION
    Create a new directory and directly move into it
    #>
    param (
        [Parameter(Mandatory)]
        [String]$Name
    )
    New-Item -Name $name -ItemType Directory
    Set-Location $Name
}

Set-Alias -Name ll -Value ls -Description "I need it like this"

Invoke-Expression (& { (zoxide init powershell | Out-String) })

Write-Host ""
Write-Host "Hey-Ho" -ForegroundColor Green
Write-Host ""

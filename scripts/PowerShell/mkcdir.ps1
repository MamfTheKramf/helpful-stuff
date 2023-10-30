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
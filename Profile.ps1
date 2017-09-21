
<#PSScriptInfo

.VERSION 2.0

.GUID a9697818-4079-4c1a-af11-ff40f3ff647c

.AUTHOR 
    Omer Barel

.COMPANYNAME 
    JungoIT

.COPYRIGHT 
    Omer Barel

.TAGS 
    profile

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 
    See Add-VMwareModules Function below

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES
    This is my first release for a simple Powershell profile I wrote 
    Updated to load a set of functions from a sepcific directory

#>

<# 

.DESCRIPTION 
 Sample PowerShell Profile
 For a getting started guide with profiles, read here - https://msdn.microsoft.com/en-us/powershell/scripting/core-powershell/ise/how-to-use-profiles-in-windows-powershell-ise 
 This Profile will:
 * Load a bunch of functions to the memory so you can call them when needed. Most I gathered from others and added as-is
 * Load a script to the ISE window. I'm using a template script to keep my scripts organized and this helps so I can quickly copy-paste it to a new script window and start coding fast

#> 

Param()

Write-Host "The below functions are avaialble. Use Get-Help {Function} -Full for instructions and details" -ForegroundColor Yellow -BackgroundColor DarkMagenta

$functions = Get-ChildItem -Path "C:\Users\omerb\Documents\WindowsPowerShell\Functions"
$Num = 1
foreach ($func in $functions) {
    $Name = $func.Name
    . "C:\Users\omerb\Documents\WindowsPowerShell\Functions\$Name"
    Write-Host "$Num : $Name" -ForegroundColor Yellow -BackgroundColor DarkMagenta
    $Num = $Num + 1
}

#### Loads Script Template for quick start ###

$Template_Path = "C:\Users\omerb\Documents\WindowsPowerShell\Script_Template.ps1"
$Pathexists = Test-Path $Template_Path
if ($Pathexists -eq $true) {
    psedit $Template_Path
}
else {
    write-host "Path to script template missing. Please check the path to the script template in your profile and modify accordingly!" -ForegroundColor Red -BackgroundColor Black
}
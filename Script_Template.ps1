
<#PSScriptInfo

.VERSION 1.0

.GUID ec0f2fde-345b-47fe-a2e5-167ad146ed5a

.AUTHOR Omer Barel

.COMPANYNAME JungoIT

.COPYRIGHT 

.TAGS 
    template

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES
    First release

#>

<# 

.DESCRIPTION 
 "Simple Script Template with a few sample commands to get you starting" 

#> 

# Actual Template Starts Below

<#
.SYNOPSIS
  <Overview of script>

.DESCRPTION
  <Brief description of script>

.PARAMETER <Parameter_Name>
    <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.0
  Author:         Omer Barel
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>


#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Parameters
[CmdletBinding()]
Param(
  [Parameter(Mandatory=$false,Position=1)] # Non-mandatory String type parameter with a default value of "one" in the 1st position
   [string]$stringparameter="one",
	
   [Parameter(Mandatory=$false)] # Non-mandatory integer type parameter with a default value of 2
   [int]$integerparameter=2,

   [Parameter(Mandatory=$false)] # Non-mandatory array type parameter with a default values of [0]=10,[1]=20,[2]=30
   [array]$arrayparameter=@(10,20,30),

   [Parameter(Mandatory=$false)] # Non-mandatory boolean type parameter with a default value of TRUE
   [bool]$booleanparameter=$True
)

#---------------------------------------------------------[Initialisations & Functions]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#Dot Source required Function Libraries
. "C:\Users\omerb\Documents\WindowsPowerShell\Function-Write-Log.ps1"

$ArrayCollection = @() # Declare and reset the Array
$ArrayObject = "" | Select 1stattr, 2ndattr, 3rdattr # Variable Attributes
$ArrayCollection += $ArrayObject # Build Array

# Declare Log Location

$logpath = "c:\temp\scriptlog.log"

#-----------------------------------------------------------[Execution]------------------------------------------------------------

#Script Execution goes here

# Log Initialization

Write-Log -Message 'Initialize Log.' -Path $logpath



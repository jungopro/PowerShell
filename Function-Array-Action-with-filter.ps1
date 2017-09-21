
<#PSScriptInfo

.VERSION 1.0

.GUID 0682300e-c9b6-4c25-a0e0-2faca78cc844

.AUTHOR Omer Barel

.COMPANYNAME JungoIT

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

<# 

.DESCRIPTION 
 This function will take a .CSV file and run a command against specific items in the array
 The function will count all the items that has a numeric value inside a specific column and then execute a command against these items only
 In this example function, some computers in the .CSV has a Startup Priority and some don't. The function will filter only those with a value in the StartupPriority column
 and will run a command against each one
 $Servers = All the items in the .CSV
 $Physical_Servers = only servers with some number in the StartupPriority column

#> 

Param()


function Array-Action-with-filter {
    <#
.SYNOPSIS
	Run a command on a filtered array

.DESCRIPTION
    This function will take a .CSV file and run a command against specific items in the array
    The function will count all the items that has a numeric value inside a specific column and then execute a command against these items only
    In this example function, some computers in the .CSV has a Startup Priority and some don't. The function will filter only those with a value in the StartupPriority column
    and will run a command against each one
    $Servers = All the items in the .CSV
    $Physical_Servers = only servers with some number in the StartupPriority column
	  
.INPUTS
	C:\Scripts\computers.csv - Sample .CSV with a list of computers. 
	Example:
	hostname,ip,iLOIP,StartupPriority,ShutdownPriority
	hostname1,192.168.1.10,192.168.2.10,1,1,1
	    
.OUTPUTS
    None
	
.NOTES
    Version:        1
    Author:         Omer Barel
    Creation Date:  March 27, 2017
    Purpose/Change: Initial Development
  
.EXAMPLE
    Array-Action-with-filter.ps1
#>

    $All_Objects = Import-Csv -Path "c:\scripts\computers.csv" # The Entire Array
    $Filtered_Objects = $All_Objects | where {$_.StartupPriority -ne ""} # The Array after applying a filter
    for ($Counter = 1; $Counter -le $Filtered_Objects.Count; $Counter++) {
        $Array_Object = $Filtered_Objects | where {$_.StartupPriority -eq $Counter} # The object in the array to act on
        Write-Host ($Array_Object.hostname, $Counter) # The action to exectue on the object
    }
}

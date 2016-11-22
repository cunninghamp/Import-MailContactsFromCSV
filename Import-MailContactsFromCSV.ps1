<#
.SYNOPSIS
Import-MailContactsFromCSV.ps1 - Create new mail contacts in Exchange from a CSV file

.DESCRIPTION 
This PowerShell script will take contact data from a CSV file and create mail contacts
in Exchange.

.OUTPUTS
Results are written to a results.log file.

.PARAMETER CSVFileName
Use this parameter to specify a different CSV file name than the
default "contacts.csv".

.PARAMETER OU
Use this parameter to specify an organizational unit for the
contacts to be created in.

.EXAMPLE
.\Import-MailContactsFromCSV.ps1 -CSVFileName externalcontractors.csv

.NOTES
Written by: Paul Cunningham

Find me on:

* My Blog:	http://paulcunningham.me
* Twitter:	https://twitter.com/paulcunningham
* LinkedIn:	http://au.linkedin.com/in/cunninghamp/
* Github:	https://github.com/cunninghamp

For more Exchange Server tips, tricks and news
check out Exchange Server Pro.

* Website:	http://exchangeserverpro.com
* Twitter:	http://twitter.com/exchservpro

Change Log
V1.00, 22/11/2016 - Initial version
#>

param (
	
    [Parameter( Mandatory=$false)]
    [string]$CSVFileName="Contacts.csv",
    
    [Parameter( Mandatory=$false)]
    [string]$OU="exchangeserverpro.net/Company/Contacts"

)

$logfile = "results.log"

Get-Date | Out-File $logfile

#Check if OU exists
try {
    Get-OrganizationalUnit $OU -ErrorAction STOP
}
catch {
    $message = "The OU $OU was not found"
    $message | Out-File $logfile -Append
    throw $message
}

If (Test-Path $CSVFileName) {

    #Import the CSV file
    $csvfile = Import-CSV $CSVFileName
        
    #Loop through CSV file
    foreach ($line in $csvfile) {

        try {
            #Create the mail contact    
            New-MailContact -Name $line.Name -ExternalEmailAddress $line.ExternalEmailAddress -OrganizationalUnit $OU -ErrorAction STOP
            "$($line.Name) was created successfully." | Out-File $logfile -Append
        }
        catch {
            
            $message = "A problem occured trying to create the $($line.Name) contact"
            $message | Out-File $logfile -Append
            Write-Warning $message
            Write-Warning $_.Exception.Message
            $_.Exception.Message | Out-File $logfile -Append
        }

    }
}
else {

    $message = "The CSV file $CSVFileName was not found."
    $message | Out-File $logfile -Append
    throw $message

}



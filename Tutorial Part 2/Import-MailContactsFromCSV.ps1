#Parameters needed:
# -UpdateExisting (optional, default to false)

param (
	
    [Parameter( Mandatory=$false)]
    [string]$CSVFileName="Contacts.csv",
    
    [Parameter( Mandatory=$false)]
    [string]$OU="exchangeserverpro.net/Company/Contacts"

)

#RESEARCH
# - work out field names to map to a CSV template

#TODO
# - output an error log to help troubleshooting
# - option to force update of existing contacts
# - make sure works with EXO as well
# - Validate that cmdlets are available (verifies EMS/remoting, and RBAC)

#No longer needed due to script parameter
#$CSVFileName = "Contacts.csv"

#Check if OU exists
try {
    Get-OrganizationalUnit $OU -ErrorAction STOP
}
catch {
    throw "The OU $OU was not found."
}

If (Test-Path $CSVFileName) {

    #Import the CSV file
    $csvfile = Import-CSV $CSVFileName
        
    #Loop through CSV file
    foreach ($line in $csvfile) {

        try {
            #Create the mail contact    
            #TODO - log to results.log
            New-MailContact -Name $line.Name -ExternalEmailAddress $line.ExternalEmailAddress -OrganizationalUnit $OU -ErrorAction STOP
        }
        catch {
            #TODO - log to results.log
            Write-Warning "A problem occured trying to create the $($line.Name) contact"
            Write-Warning $_.Exception.Message
        }

    }
}
else {

    throw "The CSV file $CSVFileName was not found."

}



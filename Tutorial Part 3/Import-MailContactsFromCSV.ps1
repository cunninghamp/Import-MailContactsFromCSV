#Parameters needed:
# -UpdateExisting (optional, default to false)

param (
	
    [Parameter( Mandatory=$false)]
    [string]$CSVFileName="Contacts.csv",
    
    [Parameter( Mandatory=$false)]
    [string]$OU="exchangeserverpro.net/Company/Contacts"

)

$logfile = "results.log"

Get-Date | Out-File $logfile

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



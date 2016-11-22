#Parameters needed:
# -FileName (optional, default to specific file name)
# -OU (optional, no default)
# -UpdateExisting (optional, default to false)

#RESEARCH
# - work out field names to map to a CSV template

#TODO
# - output an error log to help troubleshooting
# - option to force update of existing contacts
# - make sure works with EXO as well

$CSVFileName = "Contacts.csv"

If (Test-Path $CSVFileName) {


    #Import the CSV file
    # - include logic to handle invalid/missing file name

    $csvfile = Import-CSV $CSVFileName

    #Loop through CSV file

        ## Validate that cmdlets are available (verifies EMS/remoting, and RBAC)
        ## Create contact
        ## Include error handling, write to console and log (results.log)

    foreach ($line in $csvfile) {

        try {
            New-MailContact -Name $line.Name -ExternalEmailAddress $line.ExternalEmailAddress -ErrorAction STOP
        }
        catch {
            Write-Warning "A problem occured trying to create the $($line.Name) contact"
            Write-Warning $_.Exception.Message
        }

    }

        ## Write success to log as well (results.log)

}
else {

    throw "The CSV file $CSVFileName was not found."

}



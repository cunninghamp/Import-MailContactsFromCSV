#Parameters needed:
# -FileName (optional, default to specific file name)
# -OU (optional, no default)
# -UpdateExisting (optional, default to false)

#TODO
# - work out field names to map to a CSV template
# - output an error log to help troubleshooting
# - option to force update of existing contacts
# - make sure works with EXO as well


#Import the CSV file
# - include logic to handle invalid/missing file name

#Loop through CSV file

## Validate that cmdlets are available (verifies EMS/remoting, and RBAC)
## Create contact
## Include error handling, write to console and log (results.log)
## Write success to log as well (results.log)
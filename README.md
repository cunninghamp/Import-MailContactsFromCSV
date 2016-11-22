#Import-MailContactsFromCSV.ps1

This PowerShell script will take contact data from a CSV file and create mail contacts in Exchange. Results are written to a results.log file.

##Usage

* **-CSVFileName** - Use this parameter to specify a different CSV file name than the default "contacts.csv".
* **-OU** - Use this parameter to specify an organizational unit for the contacts to be created in.

```
.\Import-MailContactsFromCSV.ps1 -CSVFileName externalcontractors.csv
```

##Credits

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

# Import-MailContactsFromCSV.ps1

This PowerShell script will take contact data from a CSV file and create mail contacts in Exchange. Results are written to a results.log file.

## Usage

* **-CSVFileName** - Use this parameter to specify a different CSV file name than the default "contacts.csv".
* **-OU** - Use this parameter to specify an organizational unit for the contacts to be created in.

```
.\Import-MailContactsFromCSV.ps1 -CSVFileName externalcontractors.csv
```

## Credits
Written by: Paul Cunningham

Find me on:

* My Blog:	https://paulcunningham.me
* Twitter:	https://twitter.com/paulcunningham
* LinkedIn:	https://au.linkedin.com/in/cunninghamp/
* Github:	https://github.com/cunninghamp

Check out my [books](https://paulcunningham.me/books/) and [courses](https://paulcunningham.me/training/) to learn more about Office 365 and Exchange Server.

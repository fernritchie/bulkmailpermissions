# This will prompt you to enter tenancy credentials
# You must have the correct administrative rights

Connect-ExchangeOnline 

# This will import necessary modules

Import-Module ExchangeOnlineManagement

# This will create variable "sharedboxes" and store the new path of a cSV file within

$sharedboxes = Import-Csv C:\Users\fern.ritchie\Desktop\test.csv # specify path of csv to import


foreach($thing in $sharedboxes){ Add-RecipientPermission "$($thing | select -exp HEADER)" -AccessRights 
SendAs -Trustee USER EMAIL ADDRESS -confirm:$false }

# Where it says HEADER, this is specifying the name of the column in your csv. Either specify the actual 
header name or go into the csv and add HEADER on the first line of your csv
# Where it says USER EMAIL ADDRESS, specify the recipient email address

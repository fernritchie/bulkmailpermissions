# This will prompt you to enter tenancy credentials
# You must have the correct administrative rights

Connect-ExchangeOnline 

# This will import necessary modules

Import-Module ExchangeOnlineManagement

# This will create variable "sharedboxes" and store the new path of a cSV file within

$outfile = "C:\temp\Outfile.csv"
$newcsv = {} | Select "EMAIL_ADDRESS" | Export-Csv $outfile
$csvfile = Import-Csv $outfile
$csvfile.EMAIL_ADDRESS = "test@email.com"


# The variable emailaddress will prompt the user to enter the email addresses that belong to the mailboxes you wish the user to have access to

$emailaddress = Read-Host -Prompt "Please enter the email addresses that you would like to give access to"


# This will add the prompted data to the variable 'csvfile'
$csvfile.EMAIL_ADDRESS = $emailaddress

Write.Output = $emailaddress


# This will append the data to the csv file saved in temp files
$csvfile | Export-CSV $outfile -Append


$sharedboxes = Import-Csv C:\Users\fern.ritchie\Desktop\test.csv # specify path of csv to import


# This will prompt the user to enter the email address of the mailbox receiving these permissions

$delegateuser = Read-Host -Prompt "Please enter the email address of the delegate mailbox"



# This loop will loop through everything within the CSV file that the user has input and assign 'send as' access to it.

foreach($thing in $sharedboxes){ Add-RecipientPermission "$($thing | select -exp EMAIL_ADDRESS)" -AccessRights 
SendAs -Trustee $delegateuser -confirm:$false }

# Where it says HEADER, this is specifying the name of the column in your csv. Either specify the actual 
header name or go into the csv and add HEADER on the first line of your csv
# Where it says USER EMAIL ADDRESS, specify the recipient email address

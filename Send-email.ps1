################################################################################
# Backup the SharePoint Farm using Powershell:
#     Backup-SPFarm -Directory $RemoteLocation -BackupMethod full
#
# This script handles the backup of Sharepoint and puts the data at a remote location. 
# Following completion, it will also send a status email and then exit. 
# It will also handle the number of backups in place.
################################################################################
# NOTE:  The Task Schedule that runs this MUST include the day specified in $WhichDayToClean,
#     otherwise the cleanup section of the script will not prune old backups 
################################################################################

$msg = new-object Net.Mail.MailMessage

######################################
# Location variables
######################################
$hostName = $env:computername
$smtpserver = "isis.uoecs.org" # Please put the name of the email server
$msg.From = 'devportaladmin@uoecs.org' # Please put the address the email should come FROM
$TheUser = "devportaladmin@uoecs.org" # Please put WHO to send TO
$subject = "This is a test email"
$msg.Body = "<H2>Details of the JOB HERE...</H2>" #First line of email

# Once configured, Leave alone below this point...
################################################################################
$smtp = new-object Net.Mail.SmtpClient($smtpserver)
$msg.Subject = $subject
$msg.To.Add($TheUser)
$msg.IsBodyHtml = $True 

$CurrentDateandTime = (get-date)
$CurrentDate = (get-date).Date
$FindDay = get-date $CurrentDate -format dddd
$msg.body = $msg.body + "The PROCESS:  <BR>"
$msg.body = $msg.body + "Started at: $CurrentDateandTime <BR>"

################################################################################

$CurrentDateandTime = (get-date)
$msg.body = $msg.body + "And ended at:  $CurrentDateandTime.<HR>"


## Do some job here...
##############################

$msg.body = $msg.body + "Some details go here:  ($CurrentDateandTime) <BR>"

## Calculate some details here...
##############################


## Send an email with history
##############################
$msg.body = $msg.body + "Summary information here... :<BR>"


$msg.body
$smtp.Send($msg)
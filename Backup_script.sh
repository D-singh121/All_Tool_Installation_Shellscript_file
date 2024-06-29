#!/bin/bash
SOURCE="/home/dee_singh/Devops_works/Corporate_Shell_Script/backup_source"
DESTINATION="/home/dee_singh/Devops_works/Corporate_Shell_Script/backup_destination"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

# Create backup directory and copy files
mkdir -p $DESTINATION/$DATE
cp -r $SOURCE $DESTINATION/$DATE
echo "Backup completed on $DATE"


# •SOURCE: The directory to be backed up.
# •DESTINATION: The directory where the backup will be stored.
# •DATE: Captures the current date and time to create a unique backup folder.
# •mkdir -p $DESTINATION/$DATE: Creates the backup directory if it does not exist.
# •cp -r $SOURCE $DESTINATION/$DATE: Copies the contents of the source directory
# to the backup directory.
# •echo "Backup completed on $DATE": Outputs a message indicating the completion
# of the backup.

# to run the backup in every minute
# edit the cronetab and create a sheduler 
# "crontab -e"
# paste this backup command file below
#  * * * * * /path/to/backup_script.sh
# minute hour day-in-month  month day-in-week   <--- this is the format
# eg: 0 6 * * *    <--- means: At 06:00 on every day of month and week

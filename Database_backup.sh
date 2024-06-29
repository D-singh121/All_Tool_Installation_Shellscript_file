# # Install MySQL:
# sudo apt install mysql-server

# # Set up MySQL password:
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY
# 'root';
# FLUSH PRIVILEGES;


#!/bin/bash
DB_NAME="mydatabase"
BACKUP_DIR="/path/to/backup"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
# Perform a database backup and save it to the backup directory
mysqldump -u root -p $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql
echo "Database backup completed: $BACKUP_DIR/$DB_NAME-$DATE.sql"



# Explanation
# •DB_NAME: The name of the database to back up.
# •BACKUP_DIR: The directory where the backup will be stored.
# •DATE: Captures the current date and time.
# •mysqldump -u root -p $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql:
# Dumps the database to a SQL file.
# •echo "Database backup completed: $BACKUP_DIR/$DB_NAME-$DATE.sql":
# Outputs a message indicating the completion of the backup.
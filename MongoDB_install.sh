
#1 Import the public key used by the package management system
sudo apt-get install gnupg curl
#To import the MongoDB public GPG key, run the following command:
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor


# 2.Create a list file for MongoDB
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

#3. Reload local package database
sudo apt-get update

#4. Install the MongoDB packages
sudo apt-get install -y mongodb-org

#5. Start MongoDB.
sudo systemctl start mongod
# if error 
sudo systemctl daemon-reload

#6.Verify that MongoDB has started successfully.
sudo systemctl status mongod
sudo systemctl enable mongod

#7. Stop MongoDB.
sudo systemctl stop mongod

#8. Restart MongoDB.
sudo systemctl restart mongod

#9. Begin using MongoDB.
mongosh



# #10. Uninstall MongoDB Community Edition
# #1. Stop MongoDB.
# sudo service mongod stop

# #2. Remove Packages.
# sudo apt-get purge "mongodb-org*"

# #3. Remove Data Directories and logs files.
# sudo rm -r /var/log/mongodb
# sudo rm -r /var/lib/mongodb


# // mongodb Commands:

# show dbs;
# use <database-name>
# show collections;

# db.createCollection('data');


#!bin/bash
# sabse pahle server install and start karenge 
sudo apt get update
sudo apt install postgresql
sudo systemctl start postgresql
sudo service postgresql restart
sudo systemctl status postgresql

# Automated repository configuration: repository setup karenge
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

# Update the package lists:
sudo apt update

# Verify Karein Ki Server Chal Raha Hai:
sudo pg_isready   
output:- "accepting connections" ye aana chahiye.

# Ab, psql command ka use karke  user ko create karenge and required permission deni hogi uske liye hum default superuser 'postgres' se login karenge.
sudo su - postgres -c psql  # hum superuser (postgres) se bhi login kar sakte hai usme password nahi hota hai.

# Ab server ready hai to ek user create kar lenge with password
CREATE USER my_user WITH PASSWORD 'my_password';
my username 'admin' and password 'admin'  # <-- confidential

# # Ab Created user 'admin' ko permission grant karenge connect karne ki databases se 
# postgress=# GRANT CONNECT ON DATABASE your_db_name TO user_name;
# eg: GRANT CONNECT ON DATABASE postgres TO admin;
# eg: GRANT CREATE ON DATABASE postgres TO admin;

# # connecting with admin user or role
# sudo psql -U admin -d postgres


#//Ctrl+L  <-- to clear the screen in psql shell.
#// \l    <-- to list all databases.
#// \du   <-- to list all users and there roles.
#// \c db_name <-- connect to any perticular database.
#// \dt+  <-- display all tables in DB
#// \d+   <-- display details of perticular tables ,indexes, views, and sequences.
#// \?    <-- show all psql commands
#// \di   <-- display all indexes
#// \dv   <-- display all views
#// \ds   <-- display all sequence
#// \dT   <-- display all types
#// \dS   <-- display all system tables







#// switch to the psql terminal
#psql
#sudo -u postgres psql

#/ check the role present or not 
#SELECT rolname FROM pg_roles WHERE rolname = 'dee_singh';

#// If rolename not present so create the rolename 
#CREATE ROLE dee_singh WITH LOGIN PASSWORD 'my_password';

#// create the database on psql
#CREATE DATABASE db_name;

#// Grant the 'dee_singh' role select permission on all table In the public schema.
#GRANT SELECT ON ALL TABLES IN SCHEMA public TO dee_singh;

#// Exit the psql adminstartive terminal by typing:
#\q

#// Now login to the normal terminal
#psql


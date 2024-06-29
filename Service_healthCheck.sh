#!/bin/bash
SERVICE="mysql"  # we can put any service name here like docker , etc... .
# Check if the service is running, if not, start it
if systemctl is-active --quiet $SERVICE; then
echo "$SERVICE is running"
else
echo "$SERVICE is not running"
systemctl start $SERVICE
fi


# Explanation
# •SERVICE: The name of the service to check.
# •systemctl is-active --quiet $SERVICE: Checks if the service is running.
# •echo "$SERVICE is running": Prints a message if the service is running.
# •syst


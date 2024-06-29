#!/bin/bash
# Check if netstat is installed
if ! command -v netstat &> /dev/null; then
  # Install netstat if not installed
  sudo apt install net-tools
fi
sudo apt install net-tools

netstat -tuln | grep LISTEN    # List all listening ports and the associated services



# Explanation
# The netstat command is used to display network connections, routing tables, and other network-related information
# It will check if netstat is not installed then install it and run the port listen command.
# •netstat -tuln: Lists all TCP and UDP listening ports.
# •grep LISTEN: Filters the output to show only listening ports.
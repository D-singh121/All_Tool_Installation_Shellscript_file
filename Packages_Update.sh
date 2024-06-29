#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt  autoclean -y
echo "System packages updated and cleaned up"


# Explanation
# sudo apt-get update: Updates the package list.
# sudo apt-get upgrade -y: Upgrades all installed packages.
# sudo apt autoremove -y: Removes unnecessary packages.
# sudo apt autoclean -y : Cleans up the package cache.
# echo "System packages updated and cleaned up": Outputs a message indicating the completion of the update and cleanup.
# update package
sudo apt update

# Install VBox
sudo apt install virtualbox

# Install extension
sudo apt install virtualbox-ext-pack -y

# Start VBox
virtualbox

# check version
VBoxManage --version




//--------------------------------------------------------------------------------------//
# from oracle package
# Install Supporting Software
sudo apt install software-properties-common

# Install GPG Key
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# Add VirtualBox Repository to Ubuntu
echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

# Install the Latest Version of VirtualBox
sudo apt update 
sudo apt install virtualbox-7.0 -y

# Install VirtualBox Extension Pack
wget https://download.virtualbox.org/virtualbox/7.0.14/Oracle_VM_VirtualBox_Extension_Pack-7.0.14.vbox-extpack  -y

# verify installation
VBoxManage --version

# start vbox
vertualbox
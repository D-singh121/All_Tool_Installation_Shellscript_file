# Update Operating System
sudo apt update && apt upgrade -y

# Install the prerequisite for adding custom PPAs:
sudo apt install software-properties-common -y

# Then proceed and add the deadsnakes PPA to the APT package manager sources list:
sudo add-apt-repository ppa:deadsnakes/ppa -y
# Press Enter to continue.

# Once the repository has been installed, run an APT update to ensure that the newly imported PPA is reflected
sudo apt update

# You can now install Python 3.12 with the following command:
sudo apt install python3.12


#To verify the installation and Python 3.12 build version
python3.12 --version


Python 3.12 on Ubuntu 22.04
How to Install Python 3.12 on Ubuntu 22.04
 October 2, 2023  Posted inUbuntu
Python is a high-level, interpreted programming language known for its simplicity, readability, and versatility. It is used for a wide range of applications, including web development, data analysis, artificial intelligence, scientific computing, automation, and more.

Python’s versatility and ease of use make it an ideal choice for both beginners and experienced developers. It is often recommended as a first programming language due to its simplicity and readability.


Python 3.12 is the latest stable release of the Python programming language. This tutorial illustrates two methods of how to install it on your Ubuntu 22.04 OS.

Install Python 3.12 from the deadsnakes PPA
Manually build Python 3.12 from the source code
Update Operating System
Update your Ubuntu 22.04 operating system to the latest version with the following command:

# apt update && apt upgrade -y
Method 1: Install Python 3.12 with APT
Installing Python 3.12 on Ubuntu 22.04 using APT is quite easy, a big thumbs up to the deadsnakes custom PPA!

This makes it easy to install Python on Ubuntu and be able to receive continued updates, bug fixes, and security updates.

Install the prerequisite for adding custom PPAs:

# apt install software-properties-common -y
Then proceed and add the deadsnakes PPA to the APT package manager sources list:

# add-apt-repository ppa:deadsnakes/ppa
Deadsnakes PPA on Ubuntu 

Press Enter to continue.

Once the repository has been installed, run an APT update to ensure that the newly imported PPA is reflected.

# apt update
You can now install Python 3.12 with the following command:

# apt install python3.12
To verify the installation and Python 3.12 build version, perform the following:

# python3.12 --version
3.12.0

# If you have installed Python 3.12 using the APT package manager, the PIP will not be installed by default. To install PIP, run the following command:
sudo curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12 

#You can check PIP for the Python 3.12 version 
ip3.12 -V


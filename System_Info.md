## General System Information:-------------------------------------------------------------------------

- ```uname -a```: This command displays details about your system name, kernel version, hostname, and architecture.
- ```lsb_release -a```: This command provides information about your specific Ubuntu distribution and version.
- ```dmidecode ``` (requires sudo): This command retrieves detailed information about your system hardware using the System Management BIOS (SMBIOS) data. Be sure to use sudo before the command as it requires administrative privileges.

## CPU Information:------------------------------------------------------------------------------------------

- ```lscpu``` : This is a great tool to get a quick overview of your CPU architecture, number of cores, cache size, and instruction set support.
- ```cat /proc/cpuinfo``` : This command offers a more in-depth view of individual CPU cores and their specific properties.

## Memory Information:------------------------------------------------------------------------------------------

- ```free -m```: This command displays information about your system's memory usage in megabytes, including total, used, available memory, and swap space.
- ```top```: This is a powerful tool that provides a real-time overview of memory usage by various processes running on your system.

## Storage Information:-------------------------------------------------------------------------------------------------

- ```df -h ``` : This command displays human-readable information about disk usage for all mounted partitions, including total size, used space, available space, and filesystem type.
- ``` du -sh /path/to/directory```: (use sudo) This command estimates the disk usage of a specific directory and all its subdirectories.

## Network Information:--------------------------------------------------------------------------------------

- ``` ifconfig ``` : This is a traditional command that displays information about your network interfaces, including IP addresses, subnet masks, and MAC addresses. However, for newer systems, ip addr is recommended.
- ``` ip addr show ```: This command offers a more detailed view of network interfaces and their configuration. It's a good alternative to ifconfig.
- ```netstat -a ``` : This command lists all active network connections, including listening and established connections.

# All IN ONE:-----------------------------------------------------------------------------
- ``` uname -a ```
- ``` lsb_release -a ```
- ``` dmidecode (requires sudo) ```
- ``` lscpu ```
- ``` cat /proc/cpuinfo ```
- ``` free -m ```
- ``` top ```
- ``` df -h ```
- ``` du -sh /path/to/directory ```
- ``` ifconfig (consider ip addr for newer systems) ```
- ``` ip addr show ```
- ``` netstat -a ```

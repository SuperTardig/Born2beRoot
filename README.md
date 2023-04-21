# born2beRoot
The goal of this 42 school project is to introduce us to the basics of system administration and to the concept of virtual machines and virtualization. I needed to chose between the latest stable release of Debian or CentOS to create an extremely basic server that I could connect to using SSH. I choose Debian due to it being a lot more beginner friendly. The project required you to set up 2 encrypted partitions using LVM (or manually partition it so it has 7 encrypted partion for the bonus). The SSH sevice had to run on port 4242 only and UFW had to be configured to only leave 4242 open. We had to implement a strong password policy and we also had to implement a secure configuration for user in the sudo group.

# `monitoring.sh`
Finally, we had to create a simple script that displyed information about the machine (listed below) every 10 minutes using crontab. A cron job had to be created that executed the script and displayed it to every terminal using `wall`

The information required are has followed:
  - Achitecture and kernel version
  - Number of physical processors
  - Number of virtual processors
  - Current available RAM and utilization rate
  - Current available memore and utilization rate
  - Date and time of last reboot
  - Whether LVM is active or not
  - Number of active connections
  - Number of users using the server
  - The IPv4 addres and MAC address
  - Number of commands used with sudo

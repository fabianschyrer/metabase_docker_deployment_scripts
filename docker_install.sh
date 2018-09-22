#####################################################################################################
#																									#
# Scope:			Install Docker CE (Community Edition) 											#
# Date created:		2018-09-22																		#
# created by:		Fabian Schyrer, Central Group, General Manager Cloud Engineering				#
#																									#
#####################################################################################################

# Update YUM
echo 
echo "*** Updating YUM packages"
echo
sudo yum check-update -y
sudo yum update -y
yum clean all
echo

# Download and installation of Docker CE
echo "*** Downloading and installing Docker CE"
echo
curl -fsSL https://get.docker.com/ | sh 
echo

# Starting Docker Deamon
echo "*** Starting Docker Deamon"
sudo systemctl start docker
echo

# Check Docker Deamon status
echo "*** Checking Docker Deamon status"
echo
sudo systemctl status docker
echo

# Enable Docker Deamon for Startup after reboot
echo "*** Enabling Docker Deamon for automatic startup after reboot"
echo
sudo systemctl enable docker
sleep 5
echo

# Add current User to Docker Group
echo "*** Adding" $USER "to Docker Group"
echo
sudo usermod -aG docker $USER
echo $USER "has been added to Docker Group"
sleep 5
echo

# Test Docker / Show Docker containers
echo "*** You are currently running the following Docker containers"
echo
sudo docker ps -a
echo


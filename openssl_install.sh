#####################################################################################################
#																									#
# Scope:			Install OpenSSL	 																#
# Date created:		2018-09-22																		#
# created by:		Fabian Schyrer, Central Group, General Manager Cloud Engineering				#
#																									#
#####################################################################################################

# Update YUM
echo 
echo "*** Updating YUM packages"
sudo yum check-update -y
sudo yum update -y
yum clean all
echo

# Install git client
echo "*** Installing git client"
sudo yum install openssl -y
echo



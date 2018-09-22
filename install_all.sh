#####################################################################################################
#																									#
# Scope:			Installation of:																#
#					* git Client																	#
#					* Docker client 																#
#						** Register GCR Key (JSON)													#
#					* Google Cloud SDK																#
#					* OpenSSL 																		#
#					* Metabase Containers															#
#						** PostgreSQL																#
#						** PG-Admin4																#
#						** Metabase																	#
#						** NGINX			 														#
# Date created:		2018-09-22																		#
# created by:		Fabian Schyrer, Central Group, General Manager Cloud Engineering				#
#																									#
#####################################################################################################

# Ceate bitbucket directory
echo
echo "*** Creating local source code directory in" $HOME
cd $HOME
mkdir bitbucket
cd bitbucket
echo

# Define Variables
workdir="$(pwd)"
echo

#Print Variables 
echo "*** Your working directory is:" $workdir
echo 

# Update YUM
echo "*** Updating YUM packages"
echo
sudo yum check-update -y
sudo yum update -y
yum clean all
echo

# Install git client
echo "*** Installing git client"
echo
sudo yum install git -y
echo

# Display git version
echo "*** You are currently running the following git client version"
git --version
echo

# Cloning bitbucket Deployment Scripts repository
echo 
echo "*** Cloning bitbucket deployment scripts repository"
echo 
git clone git@bitbucket.org:<REPOSITORY>/metabase-docker-deployment-scripts.git
echo

# Start Docker CE deployment script
echo "*** Starting Docker CE deployment script"
$workdir/metabase-docker-deployment-scripts/docker_install.sh
echo

# Register GCR key
echo "*** Registering GCR key file"
echo
cat $workdir/../gcr_key.json | sudo docker login -u _json_key --password-stdin  https://us.gcr.io
echo

# Start OpenSSL script
echo "*** Starting OpenSSL deployment script"
$workdir/metabase-docker-deployment-scripts/openssl_install.sh
echo

# Start Google Cloud SDK deployment script
echo "*** Starting Google Cloud SDK deployment script"
$workdir/metabase-docker-deployment-scripts/gcloud_install.sh
echo

# Start Google Cloud SDK deployment script
echo "*** Starting OpenSSL deployment script"
$workdir/metabase-docker-deployment-scripts/openssl_install.sh
echo

# Deploy Metabase Environment
echo "*** Starting Metabase deployment script"
$workdir/metabase-docker-deployment-scripts/metabase_deploy.sh
echo

# Final notice
echo "*** Metabase has been deployed successfully."
echo "*** If you want to delete the deployment, please run the cleanup script"
echo "*** command: "$workdir"/metabase-docker-deployment-scripts/metabase_cleanup.sh"
echo


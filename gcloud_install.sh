#####################################################################################################
#																									#
# Scope:			Install Google Cloud SDK 			 											#
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

# Download and installation of Google Cloud SDK
echo "*** Downloading and installing Google Cloud SDK"
echo
sudo yum install google-cloud-sdk.noarch -y
sudo yum install google-compute-engine.noarch -y
sudo yum install google-compute-engine-oslogin.x86_64 -y
echo

# Updating Google Cloud SDK components
echo "*** Updating Google Cloud SDK components"
echo
sudo yum makecache && \
sudo yum update kubectl \
				google-cloud-sdk \
				google-cloud-sdk-app-engine-grpc \
				google-cloud-sdk-pubsub-emulator \
				google-cloud-sdk-app-engine-go \
				google-cloud-sdk-cloud-build-local \
				google-cloud-sdk-datastore-emulator \
				google-cloud-sdk-app-engine-python \
				google-cloud-sdk-cbt \
				google-cloud-sdk-bigtable-emulator \
				google-cloud-sdk-datalab \
				google-cloud-sdk-app-engine-java
echo 

# Installing Google Cloud SDK beta components
echo "*** Installing Google Cloud SDK beta components and updating all components"
echo
sudo yum update google-cloud-sdk -y
echo

# Display Google Cloud SDK version
echo "*** Your Google Cloud SDK version is:"
echo
gcloud version
echo

# Display Google Cloud SDK components
echo "*** Your Google Cloud SDK has the following components installed:"
gcloud components list
echo

# Show Google Cloud SDK configuration
echo "*** Your current Google Cloud SDK configuration is using a service account, please change to your personalized account."
echo
gcloud config list
echo 

# Initializing Google Cloud SDK
echo "*** Initializing Google Cloud SDK"
echo
gcloud init
echo 

# Show Google Cloud SDK configuration
echo "*** Your current Google Cloud SDK configuration"
echo
gcloud config list
echo 

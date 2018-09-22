#####################################################################################################
#																									#
# Scope:			Cleanup of:																		#
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

echo 
echo "*** Starting Cleanup"
echo

echo "*** Removing Docker"
sudo yum remove docker-ce.x86_64 -y
echo

echo "*** Removing git client"
sudo yum remove git.x86_64 -y
echo

echo "*** Removing OpenSSL"
sudo yum remove openssl -y
echo

echo "*** Removing Google Cloud SDK"
sudo yum remove google-cloud-sdk.noarch -y
sudo yum remove google-compute-engine.noarch -y
sudo yum remove google-compute-engine-oslogin.x86_64 -y
echo

echo "*** Deleting bitbucket folder and repositories"
rm -Rf /home/fabianalexander/bitbucket
echo

echo "*** Deleting Google Cloud SDK configuration"
rm -Rf /home/fabianalexander/.config/gcloud
echo
echo "*** Cleanup successfull"
echo


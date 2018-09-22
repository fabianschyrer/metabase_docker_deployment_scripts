#####################################################################################################
#																									#
# Scope:			Deploy Metabase Containerized App	 											#
# Date created:		2018-09-22																		#
# created by:		Fabian Schyrer, Central Group, General Manager Cloud Engineering				#
#																									#
#####################################################################################################

# Define Variables
workdir="$(pwd)"

#Print Variables
echo 
echo "*** Your working directory is:" $workdir
echo 

# Cloning required bitbucket source code repositories
echo "*** Step 1/3: Cloning required bitbucket source code repositories"
echo 
git clone git@bitbucket.org:<REPOSITORY>/metabase-docker-postgres.git
echo 
git clone git@bitbucket.org:<REPOSITORY>/metabase-docker-pgadmin4.git
echo 
git clone git@bitbucket.org:<REPOSITORY>/metabase-docker.git
echo 
git clone git@bitbucket.org:<REPOSITORY>/metabase-docker-nginx.git
echo 

# Pulling bitbucket repositories
echo "*** Step 2/3: Pulling required Docker images from GCR"
echo
$workdir/metabase-docker-postgres/pull.sh
echo
$workdir/metabase-docker-pgadmin4/pull.sh
echo
$workdir/metabase-docker/pull.sh
echo
$workdir/metabase-docker-nginx/pull.sh
echo 

# Creating docker volumes, docker network and deploying containers
echo "*** Step 3/3: Creating Docker volumes, Docker network and deploying containers"
echo 
echo "*** Step 3/3 - PostgreSQL: Creating Docker volume, Docker network and deploying PostgreSQL container"
echo 
cd $workdir/metabase-docker-postgres/
./run.sh
echo 
echo "*** Sleep 20 seconds - Time to finish DB provisioning"
sleep 20
echo 

echo "*** Step 3/3 - PG-Admin4: Creating Docker volume, Docker network and deploying PG-Admin4 container"
echo 
cd $workdir/metabase-docker-pgadmin4
./run.sh
echo 

echo "*** Step 3/3 - Metabase: Creating Docker network and deploying Metabase container"
echo 
cd $workdir/metabase-docker
./run.sh
echo 
echo "*** Sleep 20 seconds - Time to finish Metabase provisioning"
sleep 20
echo 

echo "*** Step 3/3 - NGINX: Creating Docker network and deploying NGINX container"
echo 
cd $workdir/metabase-docker-nginx
./run.sh
echo 

# Show Docker Images
echo "*** Info: Docker images:"
echo 
docker image list
echo 

# Show Docker Network Information - Simple
echo "*** Info: Metabase Docker Network information:" 
echo 
docker network list
echo 

# Show Docker Network Information for metabase-network - Detailed
echo "*** Info: Metabase Docker Network information for metabase-network bridge:" 
echo 
docker network inspect metabase-network
echo 

# Show running Docker Containers
echo "*** Info: Running Docker containers:" 
echo 
docker ps
echo

# Show all Docker Containers
echo "*** Info: All Docker containers:" 
echo 
docker ps -a
echo

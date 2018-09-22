#####################################################################################################
#																									#
# Scope:			Cleanup Metabase Containerized App	 											#
# Date created:		2018-09-22																		#
# created by:		Fabian Schyrer, Central Group, General Manager Cloud Engineering				#
#																									#
#####################################################################################################

# Define Variables
workdir="$(pwd)"

#Print Variables
echo 
echo "*** Your working directory is:"
echo $workdir
echo 

# Deleting bitbucket source code repositories
echo "*** Step 1/6: Deleting required bitbucket source code repositories"
rm -R -f metabase-docker-postgres
rm -R -f metabase-docker-pgadmin4
rm -R -f metabase-docker
rm -R -f metabase-docker-nginx
echo 
echo "metabase-docker-postgres has been deleted"
echo "metabase-docker-pgadmin4 has been deleted"
echo "metabase-docker has been deleted"
echo "metabase-docker-nginx has been deleted"
echo 

# Deleting Docker containers, images, volumes and network
echo "*** Step 2/6: Kill Metabase related Docker containers"
echo
docker kill metabase 
docker kill postgres-metabase 
docker kill pgadmin4-metabase 
docker kill nginx-metabase
echo

echo "*** Step 3/6: Remove Metabase related Docker containers"
echo
docker rm metabase
docker rm postgres-metabase 
docker rm pgadmin4-metabase 
docker rm nginx-metabase
echo

echo "*** Step 4/6: Remove Metabase related Docker network"
echo
docker network rm metabase-network
echo

echo "*** Step 5/6: Remove Metabase related Docker volumes"
echo
docker volume rm metabase-pga4vol
docker volume rm metabase-pglogvol
docker volume rm metabase-pgvol
echo

echo "*** Step 6/6: Remove Metabase related Docker images"
echo
docker rmi <DOCKER_REGISTRY>/metabase.docker.nginx
docker rmi <DOCKER_REGISTRY>/metabase.docker
docker rmi <DOCKER_REGISTRY>/metabase.docker.postgres
docker rmi <DOCKER_REGISTRY>/metabase.docker.pgadmin4
echo 

# Show Docker Images
echo "*** Info: Docker images:"
echo 
docker image list
echo 

# Show Docker Network Information
echo "*** Info: Docker network:" 
echo 
docker network list
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


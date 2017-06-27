# E:// 2017

help: 		## Shows this help
		@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'; \

all: 		## Builds the docker image, deployes containers, install ODL and start the ODL service
all: 		build deploy start

build:		## Builds the docker images
		# server-01
		sed -e "s/INDEX/1/g" puppet/odl.template.pp > puppet/odl.pp
		sed -e "s/SERVER_NAME/server-01/g" Dockerfile.template > Dockerfile
		sudo docker build -t=opendaylight_1 .

		# server-02
		sed -e "s/INDEX/2/g" puppet/odl.template.pp > puppet/odl.pp
		sed -e "s/SERVER_NAME/server-02/g" Dockerfile.template > Dockerfile
		sudo docker build -t=opendaylight_2 .

		# server-03
		sed -e "s/INDEX/3/g" puppet/odl.template.pp > puppet/odl.pp
		sed -e "s/SERVER_NAME/server-03/g" Dockerfile.template > Dockerfile
		sudo docker build -t=opendaylight_3 .

deploy:  	## Deployes the cluster
		sh deploy.sh

start:		## Starts the service
		# server-01
		sudo docker exec -itd server-01 sh -c "systemctl start opendaylight.service"
		sleep 30
		sudo docker exec -itd server-01 sh -c "/opt/opendaylight/bin/client 'bundle:install -s mvn:org.jolokia/jolokia-osgi/1.1.5'"

		# server-02
		sudo docker exec -itd server-02 sh -c "systemctl start opendaylight.service"
		sleep 30
		sudo docker exec -itd server-02 sh -c "/opt/opendaylight/bin/client 'bundle:install -s mvn:org.jolokia/jolokia-osgi/1.1.5'"

		# server-03
		sudo docker exec -itd server-03 sh -c "systemctl start opendaylight.service"
		sleep 30
		sudo docker exec -itd server-03 sh -c "/opt/opendaylight/bin/client 'bundle:install -s mvn:org.jolokia/jolokia-osgi/1.1.5'"

clean: 		## Deletes the containers. Doesn't delete the docker image
		sh delete_deployment.sh


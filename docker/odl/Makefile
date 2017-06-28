# E:// 2017

help: 		## Shows this help
		@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'; \

all: 		## Builds the docker image, deployes containers, install ODL and start the ODL service
all: 		build deploy start

build:		## Builds the docker images
                # odl.pp will amended after we start the containers later
		sed -e "s/INDEX/1/g" puppet/odl.template.pp > puppet/odl.pp
		sudo docker build -t=opendaylight .

deploy:  	## Deployes the cluster
		sh deploy.sh

start:		## Starts the service
		# server-01
		sed -e "s/INDEX/1/g" puppet/odl.template.pp > puppet/odl.pp
		sudo docker cp puppet/odl.pp server-01:/tmp/
		sudo docker exec -it server-01 sh -c "/opt/puppetlabs/bin/puppet apply /tmp/odl.pp"
		# start the service
		sudo docker exec -itd server-01 sh -c "systemctl start opendaylight.service"
		sleep 30
		sudo docker exec -itd server-01 sh -c "/opt/opendaylight/bin/client 'bundle:install -s mvn:org.jolokia/jolokia-osgi/1.1.5'"

		# server-02
		sed -e "s/INDEX/2/g" puppet/odl.template.pp > puppet/odl.pp
		sudo docker cp puppet/odl.pp server-02:/tmp/
		sudo docker exec -it server-02 sh -c "/opt/puppetlabs/bin/puppet apply /tmp/odl.pp"
		# start the service
		sudo docker exec -itd server-02 sh -c "systemctl start opendaylight.service"
		sleep 30
		sudo docker exec -itd server-02 sh -c "/opt/opendaylight/bin/client 'bundle:install -s mvn:org.jolokia/jolokia-osgi/1.1.5'"

		# server-03
		sed -e "s/INDEX/3/g" puppet/odl.template.pp > puppet/odl.pp
		sudo docker cp puppet/odl.pp server-03:/tmp/
		sudo docker exec -it server-03 sh -c "/opt/puppetlabs/bin/puppet apply /tmp/odl.pp"
		# start the service
		sudo docker exec -itd server-03 sh -c "systemctl start opendaylight.service"
		sleep 30
		sudo docker exec -itd server-03 sh -c "/opt/opendaylight/bin/client 'bundle:install -s mvn:org.jolokia/jolokia-osgi/1.1.5'"

clean: 		## Deletes the containers. Doesn't delete the docker image
		sh delete_deployment.sh


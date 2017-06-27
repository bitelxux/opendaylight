# E:// 2017

help: 		## Shows this help
		@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'; \

all: 		## Builds the docker image, deployes containers, install ODL and start the ODL service
all: 		build deploy install start

build:		## Builds the docker image
		sudo docker build -t=opendaylight .

deploy:  	## Deployes the cluster
		sh deploy.sh

install: 	## Installs ODL
		sudo docker exec -it server-01 sh -c "/opt/puppetlabs/bin/puppet apply /tmp/server-01.pp"
		sudo docker exec -it server-02 sh -c "/opt/puppetlabs/bin/puppet apply /tmp/server-02.pp"
		sudo docker exec -it server-03 sh -c "/opt/puppetlabs/bin/puppet apply /tmp/server-03.pp"

start:		## Starts the service
		sudo docker exec -itd server-01 sh -c "systemctl start opendaylight.service"
		sudo docker exec -itd server-02 sh -c "systemctl start opendaylight.service"
		sudo docker exec -itd server-03 sh -c "systemctl start opendaylight.service"

clean: 		## Deletes the containers. Doesn't delete the docker image
		sh delete_deployment.sh


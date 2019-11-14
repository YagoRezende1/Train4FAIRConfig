#!/bin/bash

echo "Welcome to Train Platform Setup!"
echo "We are installing the -=Train Platform=- locally"
echo "Version 1.0.0 (NightBuild:301020190431) for evaluation purpose, only."


if ([ $1 = "--init" ] && [ $2 = true ]) && ([ $3 = "--env" ] && [ $4 = "dev" ]); then

	rm -r /app/service-locator-data/
	rm -r /app/service-locator-docker/
	rm -r /app/common/docker-files/
	rm -r /webdav/metadata/
	rm -r /webdav/landingpage/
	rm -r /webdav/documentation/
	
	mkdir -p /app/service-locator-data/
	mkdir -p /app/service-locator-docker/
	mkdir -p /app/common/docker-files/
	mkdir -p /webdav/metadata/
	mkdir -p /webdav/landingpage/
	mkdir -p /webdav/documentation/
	
	cp wait-for-it.sh /app/common/docker-files/
	cp mongo/sd_environmentproperties.json /app/common/docker-files/
	cp sd_entrypoint.sh /app/common/docker-files/
	cp esb_entrypoint.sh /app/common/docker-files/
	
	chmod -R 777 /app/service-locator-data/
	chmod -R 777 /app/service-locator-docker/
	chmod -R 777 /app/common/docker-files/
	chmod -R 777 /webdav/metadata/
	chmod -R 777 /webdav/landingpage/
	chmod -R 777 /webdav/documentation/
	chmod -R 777 ./
	
	echo "Components Train SD and ESB are setting up..."
	echo "docker-compose loading..."
	sudo docker-compose up -d
	echo "docker-compose finished."
	echo "Components Train SD and ESB are set up!"	
	
		
	echo "Deploying the client..."
	echo "docker-compose loading..."
	sudo docker-compose -t docker-compose-red.yml up -d
	echo "docker-compose finished."
	echo "Client are set up!"
	
fi


if ([ $5 = "--init-dav" ] && [ $6 = true ]); then
	echo "Webdav servers are setting up on ports 9999 (The metadata Repository), 9998 (The Landing Pages Repository) and 9997 (The Documentation Repository)"
	echo "docker-compose loading..."
	sudo docker-compose -f docker-compose-dav.yml up -d
	echo "docker-compose finished."
	echo "Webdav Environment are set up!"
fi



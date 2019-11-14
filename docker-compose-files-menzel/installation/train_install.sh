#!/bin/bash

echo "Welcome!"
echo "We are installing the -=Train Platform=- locally"
echo "Version 1.0.0 (NightBuild:301020190431) for evaluation purpose, only."

PROPERTY_FILE=installation.properties
SECRET_PROPERTY_FILE=../../../private.properties

function getProperty {
   PROP_KEY=$1
   PROP_VALUE=`cat $PROPERTY_FILE | grep "$PROP_KEY" | cut -d'=' -f2`
   echo $PROP_VALUE
}
function getSecretProperty {
   PROP_KEY=$1
   PROP_VALUE=`cat $SECRET_PROPERTY_FILE | grep "$PROP_KEY" | cut -d'=' -f2`
   echo $PROP_VALUE
}

echo "# Reading property from $PROPERTY_FILE"
DAV_DOC_USERNAME=$(getProperty "dav.doc.username")
DAV_DOC_PASSWD=$(getProperty "dav.doc.passwd")
DAV_DOC_URL=$(getProperty "dav.doc.url")
DAV_DOC_INSTALL_CONTENT_NAME=$(getProperty "dav.doc.installation.content.name")
SETUP_MODE_INIT=$(getProperty "setup.mode.init")
SETUP_MODE_INIT_VALUE=$(getProperty "setup.mode.init.value")
SETUP_MODE_ENV=$(getProperty "setup.mode.env")
SETUP_MODE_ENV_VALUE=$(getProperty "setup.mode.env.value")
SETUP_MODE_INIT_DAV=$(getProperty "setup.mode.init.dav")
SETUP_MODE_INIT_DAV_VALUE=$(getProperty "setup.mode.init.dav.value")


echo "-=Installation settings=-"
echo 'DAV_DOC_USERNAME: '$DAV_DOC_USERNAME
echo 'DAV_DOC_PASSWD: '$DAV_DOC_PASSWD
echo 'DAV_DOC_URL: '$DAV_DOC_URL
echo 'DAV_DOC_INSTALL_CONTENT_NAME: '$DAV_DOC_INSTALL_CONTENT_NAME
echo 'SETUP_MODE_INIT: '$SETUP_MODE_INIT
echo 'SETUP_MODE_INIT_VALUE: '$SETUP_MODE_INIT_VALUE
echo 'SETUP_MODE_ENV: '$SETUP_MODE_ENV
echo 'SETUP_MODE_ENV_VALUE: '$SETUP_MODE_ENV_VALUE
echo 'SETUP_MODE_INIT_DAV: '$SETUP_MODE_INIT_DAV
echo 'SETUP_MODE_INIT_DAV_VALUE: '$SETUP_MODE_INIT_DAV_VALUE

if ([ $1 = "--init" ] && [ $2 = true ]); then

	
	cd ..
	wget --user=$DAV_DOC_USERNAME --password=$DAV_DOC_PASSWD  $DAV_DOC_URL$DAV_DOC_INSTALL_CONTENT_NAME.tar.gz
	tar xvfz $DAV_DOC_INSTALL_CONTENT_NAME.tar.gz
	cd $DAV_DOC_INSTALL_CONTENT_NAME
	
	chmod 777 train_setup.sh
	./train_setup.sh $SETUP_MODE_INIT $SETUP_MODE_INIT_VALUE $SETUP_MODE_ENV $SETUP_MODE_ENV_VALUE $SETUP_MODE_INIT_DAV $SETUP_MODE_INIT_DAV_VALUE
	
fi


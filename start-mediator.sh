#!/bin/bash

if [ ! -f openhim.crt ]
then
    echo "Fetching OpenHIM certificate"
    openssl s_client -connect localhost:5002 > openhim.crt
    echo "Adding OpenHIM certificate to keystore"
    keytool -storepass changeit -import -noprompt -trustcacerts -alias openhim \
        -file openhim.crt -keystore $JAVA_HOME/jre/lib/security/cacerts
fi

echo "Starting XDS mediator..."

cd ${MEDIATOR_DIR}

java -jar mediator-xds-1.0.3-jar-with-dependencies.jar --conf xds-mediator.properties
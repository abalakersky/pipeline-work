#!/bin/bash

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -e|--email)
    EMAILPASS="$2"
    shift # past argument
    ;;
    -l|--login)
    LOGINPASS="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if [ -z "$EMAILPASS" -a "$EMAILPASS" != " " ]; 
then
        echo "You have not entered email password"
else
	echo $(/opt/dnow/embedded/jre/bin/java -cp '/opt/dnow/webapps/DeployNow/WEB-INF/lib/*' com.opex.dnow.core.util.EncryptionUtils --encrypt $EMAILPASS)
fi

if [ -z "$LOGINPASS" -a "$LOGINPASS" != " " ]; then
        echo "Login Password not entered!"
else
	echo $(/opt/dnow/embedded/jre/bin/java -cp '/opt/dnow/webapps/DeployNow/WEB-INF/lib/*' com.opex.dnow.core.util.EncryptionUtils --md5 $LOGINPASS)
fi

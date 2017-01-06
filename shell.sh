#!/bin/bash

if [ $1 == "-h" ] || [ $1 == "--help" ]; then
        echo "
        usage : encryption_utils.sh [-e|--email] [-l|--login] <password>
        Option provided by script:
          -e,  --email    Specifying the password given is email password
          -l,  --login    Specifying the password given is login password
          <password>      Password"
else
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
        echo $(<%= install_dir %>/embedded/jre/bin/java -cp '<%= install_dir %>/webapps/DeployNow/WEB-INF/lib/*' com.opex.dnow.core.util.EncryptionUtils --encrypt $EMAILPAS)
    fi
    if [ -z "$LOGINPASS" -a "$LOGINPASS" != " " ]; then
        echo "Login Password not entered!"
    else
        echo $(<%= install_dir %>/embedded/jre/bin/java -cp '<%= install_dir %>/webapps/DeployNow/WEB-INF/lib/*' com.opex.dnow.core.util.EncryptionUtils --md5 $LOGINPAS)
    fi
fi
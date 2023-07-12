#!/bin/bash


ANSW='y'

while [ "$ANSW" == 'y' ]
do
   echo "enter a user name : "
   read MYUSER

   
	if [ ! MYUSER ]; then
                echo "enter a user name"
                exit
        fi

	RUNUSER=`/usr/bin/whoami`
	if [ "$RUNUSER" != 'root' ]; then
		echo "you are not a root user to creat new user"
		exit
	fi

	/usr/bin/id $MYUSER
	if [ $? -eq 0 ]; then
		echo "the  user $MYUSER already existed, enter diff...."
		exit
	fi

	/sbin/useradd $MYUSER
	echo "added a user $MYUSER  successfully....."

  echo "Do you want to  create new user ??"
  read ANSW
done



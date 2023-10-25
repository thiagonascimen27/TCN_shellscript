####################################################################################   
#                                                                                  #
#   Creator: Thiago Nascimento                                                     #
#   Date: 8/22/2023                                                                #
#   last Update:                                                                   #
#                                                                                  #
#   Description:                                                                   #
#   This sript was created to copy data per date of creation using rsync           #
#   server command.                                                                #
#                                                                                  # 
####################################################################################
#!/bin/bash

# Variables
USER="YOUR_USER"
PASSWORD="YOUR_PASSWORD"
REMOTESERVER="DESTINY_SERVER_IP"
SOURCEPATH="ORIGIM FOLDER PATH"
DESTINATIONPATH="DESTINATION FOLDER PATH"
DAYS=7

FILES=$(find $SOURCEPATH -type f -ctime -$DAYS)

for FILE in $FILES; do
    sshpass -p $PASSWORD scp $FILES $USER@$REMOTESERVER:$DESTINATIONPATH
done

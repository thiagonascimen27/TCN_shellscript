####################################################################################   
#                                                                                  #
#   Creator: Thiago Nascimento                                                     #
#   Date: 11/14/2023                                                               #
#   last Update:                                                                   #
#                                                                                  #
#   Description:                                                                   #
#   This sript was created to change file names according to date.                 #
#                                                                                  #
#   Case:                                                                          # 
#   The objective was to maintain daily backup versions of a system.               #
#   Every day the system makes a backup with the same name, however, I needed to   #
#   change each day's backup to the name with the date.                            #
#                                                                                  #
####################################################################################
#!/bin/bash

date=$(date +%Y%m%d)
original="/home/root/Backup.conf"
logfile="/var/log/renamebackup.txt"

# Checks if the original file exists
if [ -e "$original" ]; then
    # Separate the original file extension
    extension="${original##*.}"

    # New name of file
    newname="/Storage/Backup/Firewall/${date}_Backup.${extension}"

    # Rename file
    mv "$original" "$newname"

    echo "The file was renamed to: $newname" >> "$logfile"
else
    echo "The file $original not exist." >> "$logfile"
fi

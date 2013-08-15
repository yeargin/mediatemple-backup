#!/bin/sh

# Variables
./config.sh

pushd ${DOMAIN_PATH}

# ######### Web Site Backup ######### 
for i in ${DOMAINS_DOMAINS[@]}; do
  /usr/bin/zip -rq ${BACKUP_PATH}/$i_`date "+%Y-%m-%d"`.zip $i/
done

# ######### Clean-up Old Junk ######### 
# Deleting backups older than 30 days
# echo "Removing old files"
/usr/bin/find *.zip -mtime +30 -exec rm {} \;
popd
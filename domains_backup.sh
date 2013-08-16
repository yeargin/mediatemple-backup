#!/bin/sh

# Variables
BASEDIR=$(dirname $0)
source ${BASEDIR}/config.sh

pushd ${DOMAINS_PATH} > /dev/null

# ######### Web Site Backup ######### 
for i in ${DOMAINS_DOMAINS[@]}; do
  /usr/bin/zip -rq ${BACKUP_PATH}/$i\_`date "+%Y-%m-%d"`.zip ./$i/
done

# ######### Clean-up Old Junk ######### 
# Deleting backups older than 30 days
# echo "Removing old files"
/usr/bin/find ${BACKUP_PATH}/*.zip -mtime +30 -exec rm {} \;

popd > /dev/null

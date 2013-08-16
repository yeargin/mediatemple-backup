#!/bin/sh

# Variables
BASEDIR=$(dirname $0)
source ${BASEDIR}/config.sh

pushd ${BACKUP_PATH} > /dev/null

# ######### Database Backup ######### 
for i in ${DB_DATABASES[@]}; do
  /usr/bin/mysqldump --opt --lock-tables=false --skip-add-locks --host=${DB_HOSTNAME} --user=${DB_USERNAME} --password=${DB_PASSWORD} ${DB_USERNAME}_$i | gzip > $i\_`date "+%Y-%m-%d"`.gz
done

# ######### Clean-up Old Junk ######### 
# Deleting backups older than seven days
/usr/bin/find ${BACKUP_PATH}/*.gz -mtime +7 -exec rm {} \;

popd > /dev/null

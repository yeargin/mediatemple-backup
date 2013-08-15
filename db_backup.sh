#!/bin/sh

# Variables
./config.sh

pushd ${BACKUP_PATH}

# ######### Database Backup ######### 
for i in ${DB_DATABASES[@]}; do
  /usr/bin/mysqldump --opt --lock-tables=false --skip-add-locks --host=${DB_HOSTNAME} --user=${DB_USERNAME} --password=${DB_PASSWORD} ${DB_USERNAME}_$i | gzip > $i_`date "+%Y-%m-%d"`.gz
done

# ######### Clean-up Old Junk ######### 
# Deleting backups older than seven days
/usr/bin/find *.gz -mtime +7 -exec rm {} \;

popd
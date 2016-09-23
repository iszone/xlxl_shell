TIME_STAMP=`date +%Y%m%d%H%M`
YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`

FOLDER="/mnt/data/mongobackup/$YEAR/$MONTH/$DAY"
RET=`mkdir -p $FOLDER`
echo "backup folder is $FOLDER"

BACKUP_FILE="$FOLDER/$TIME_STAMP"
echo "backup file is $BACKUP_FILE"

RET=`/usr/local/app/mongodb/bin/mongodump -h 0.0.0.0 --port 2016 -u dba -p mima -d dbname -o $BACKUP_FILE`
RET=`/usr/local/app/mongodb/bin/mongodump -h 0.0.0.0 --port 2016 -u dba -p mima -d dbname_sh -o $BACKUP_FILE`
RET=`/usr/local/app/mongodb/bin/mongodump -h 0.0.0.0 --port 2016 -u dba -p mima -d dbname_cd -o $BACKUP_FILE`
RET=`/usr/local/app/mongodb/bin/mongodump -h 0.0.0.0 --port 2016 -u dba -p mima -d dbname_wh -o $BACKUP_FILE`
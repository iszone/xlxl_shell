TIME_STAMP=`date +%Y%m%d%H%M`
YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`

FOLDER="/mnt/data/mysqlbackup/$YEAR/$MONTH/$DAY"
RET=`mkdir -p $FOLDER`
echo "backup folder is $FOLDER"


BACKUP_FILE="$FOLDER/all.$TIME_STAMP"
echo "backup file is $BACKUP_FILE"

CMD="mysqldump -h0.0.0.0 -P2016 -udba_r -pmima --skip-lock-tables --all-databases"
echo "cmd is $CMD"

RET=`$CMD > $BACKUP_FILE`
if [ $? = 0 ]; then
    echo 'database backup success!'
else
    echo 'database backup fail'
    echo 'exit'
    exit
fi
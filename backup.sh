#! /bin/bash

cd /home/backup-shak

date=`date -I`;
mysqldump -ushakmyth -pxxxxxx --all-databases > ./sql-backups/$date.sql;

git add .
git commit -m "Backup database $date.sql"
git push
cd -

echo "Sauvegarde de shakmyth effectuée, ce jour : $date" | mail -s "Sauvegarde de shakmyth effectuée" stephane@

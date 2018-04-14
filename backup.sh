#! /bin/bash

cd /home/backup-shak

date=`date -I`;
mysqldump -ushakmyth -pXXXXXXXX --all-databases > ./sql-backups/$date.sql;

git add .
git commit -m "Backup database $date.sql"
git push

cp /home/shakscre/_site/data/db/sqlite.db ./sqlite-bak/$date.db

git add .
git commit -m "Backup database $date.db"
git push

cd -

echo "Sauvegarde de shakmyth effectuÃ©e, ce jour : $date" | mail -s "Sauvegarde de shakmyth effectuÃ©e" stephane@scopyleft.fr
echo "Sauvegarde de shakmyth effectuÃ©e, ce jour : $date" | mail -s "Sauvegarde de shakmyth effectuÃ©e" cahiers@univ-montp3.fr
echo "Sauvegarde de shakscreen effectuÃ©e, ce jour : $date" | mail -s "Sauvegarde de shakmyth effectuÃ©e" patricia.dorval@univ-montp3.fr

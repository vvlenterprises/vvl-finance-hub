@echo off
set PGPASSWORD=Admin@2026$$
set PGSSLMODE=require
pg_dump -h db.fbgqfziabostkpzlsuoz.supabase.co -U postgres -d postgres -f backup.sql

git add backup.sql
git commit -m "Daily Supabase backup"
git push
echo Backup complete!

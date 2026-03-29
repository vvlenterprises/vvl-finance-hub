@REM @echo off
@REM set PGPASSWORD=Admin@2026$$
@REM set PGSSLMODE=require
@REM pg_dump -h db.fbgqfziabostkpzlsuoz.supabase.co -U postgres -d postgres -f backup.sql

@REM git add backup.sql
@REM git commit -m "Daily Supabase backup"
@REM git push
@REM echo Backup complete!




@echo off

:: Create backup folder if not exists
if not exist backup mkdir backup

:: Generate timestamp (YYYY-MM-DD_HH-MM-SS)
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set day=%%a
    set month=%%b
    set year=%%c
)

for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set hour=%%a
    set minute=%%b
)

set timestamp=%year%-%month%-%day%_%hour%-%minute%

:: Remove space in hour (for single digit hour issue)
set timestamp=%timestamp: =0%

:: Set env
set PGPASSWORD=Admin@2026$$
set PGSSLMODE=require

:: Backup file name with timestamp
set backupfile=backup\backup_%timestamp%.sql

:: Run backup
pg_dump -h db.fbgqfziabostkpzlsuoz.supabase.co -U postgres -d postgres -f %backupfile%

:: Git push
git add .
git commit -m "Backup %timestamp%"
git push

echo Backup complete! File: %backupfile%
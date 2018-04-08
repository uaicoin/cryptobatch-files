@echo off

cls
echo Welcome to the Wallet Backup Maker! We will create a backup for your UaiCoin wallet together, including a password!
echo -create (create password)
echo -check (check password)
echo.
set /p PROGRAM= What do you want to do?: 
goto %PROGRAM%




:create
cls
set /p PASSWORD= What do you want your password to be?: 
echo %PASSWORD% > Wallet-Backup-Password.txt
attrib Wallet-Backup-Password.txt +h
pause
goto start




:check
cls
set /p PASSWORD1= What is your password?

for /f "Delims=" %%a in (Wallet-Backup-Password.txt) do (

set TEXT=%%a

)

if %PASSWORD1%==%TEXT% goto correct
echo you are wrong!!!
pause
goto start




:start
cls
echo Hello, you will be guided through making a backup for your wallet with the private spend key, the view key and the phrase simplewallet gave you.
echo -create (create your backup)
echo -check (view your backup after it's created)
set /p PROGRAM= What do you want to do?: 
goto %PROGRAM%




:create
cls
set /p BACKUP= Enter your Private Spend key first, View Key Second and phrase third separated like this: Spend/View/Phrase :   

echo [Spend Key/View Key/Phrase] : %BACKUP% > UaiCoin-Wallet-Backup.txt
attirb UaiCoin-Wallet-Backup.txt +h
pause
goto start

:check
cls
set /p PASSWORD1= What is your password?

for /f "Delims=" %%a in (Wallet-Backup-Password.txt) do (

set TEXT=%%a

)

if %PASSWORD1%==%TEXT% goto correct
echo You are wrong!
pause
goto start

:correct
start UaiCoin-Wallet-Backup.txt
pause
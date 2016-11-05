#!/bin/bash
# Simple script to save changes of a github repository
# Script utlizes default conditions
# invoke with bash gitsave.sh from terminal
clear
echo
echo This script is used to ADD COMMIT and PUSH file changes to GitHub
echo This script uses default parameters
echo Verify the parameters before proceeding
echo
echo
echo The current directory is:
pwd
echo "Is this the correct Directory?"
echo
# Verify correct directory
OPTIONS="YES NO"
select opt in $OPTIONS; do
if [ "$opt" = "YES" ]; then
clear
echo Moving On
break
elif [ "$opt" = "NO" ]; then
echo Exiting, Use CD to move to correct directory
exit
else
echo Invald selection
echo Press 1 for "YES" 2 for "NO", stil stuck? close terminal
fi
done
# Verifying add commit and push parameters
echo The script will proceed under these conditions:
echo
echo "1) Adding all files (git add .)"
echo "2) Apply one commit message  (git commit - m 'YOURMESSAGEHERE')"
echo "3) Push all file to origin master branch (git push origin master)"
echo
echo Do you accept these parameters
OPTIONS="YES NO"
select opt in $OPTIONS; do
if [ "$opt" = "YES" ]; then
clear
echo Moving On
break
elif [ "$opt" = "NO" ]; then
echo Exiting, make changes manually
exit
else
echo Invald selection
echo Press 1 for "YES" 2 for "NO", stil stuck? close terminal
fi
done
# Validating SSH connection to git hub
echo Testing connection to github
ssh -T git@github.com
echo
Echo Was SSH a success?
# Verify Was authentication successful?
OPTIONS="YES NO"
select opt in $OPTIONS; do
if [ "$opt" = "YES" ]; then
clear
echo Moving On
break
elif [ "$opt" = "NO" ]; then
echo Exiting, check internet connection, ssh keys, and username and password
exit
else
echo Invald selection
echo Press 1 for "YES" 2 for "NO", stil stuck? close terminal
fi
done
clear
sleep 1s
echo View Git Status
echo
echo
echo
git status
sleep 1s
echo
echo Adding all files to Git
git add .
sleep 1s
echo
echo
echo "Enter message for pending commit"
read MESSAGE
git commit -m '$MESSAGE'
sleep 1s
echo Pushing commits to Git hub
git push origin master
echo
echo
# Remove scripting from github online repository
echo cleaning up
git rm --cached gitsave.sh
git commit -m 'remove gitsave.sh'
git push origin master
echo Finished
echo Closing

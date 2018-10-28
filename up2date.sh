# -----------------------------------------------------------------------------
# Project name   :
# File name      : up2date.sh
# Created date   : Th10 28 2018
# Author         : Van-Nam DINH
# Last modified  : Th10 28 2018 16:33
# Guide          :
# -----------------------------------------------------------------------------
#!/bin/bash


git add .
git commit -m "up2date4today" 
git pull origin
git push origin master

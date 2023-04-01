#!/bin/bash

# Assign the environment variables passed as arguments to variables
AZUREPAT=$1
AZUSERNAME=$2
AZUSER_EMAIL=$3
AZORG=$4

# Clone the source repository and remove the Git metadata
git clone https://github.com/Abdul7777K/test.git
cd test
rm -rf .git

# Clone the target repository using Azure DevOps authentication
GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/Abdul/_git/syncWithgitEshopCommerce" 
git clone $GIT_CMD_REPOSITORY

# Copy the source files to the target repository
cp -r test/* syncWithgitEshopCommerce/

cd syncWithgitEshopCommerce

# Set the Git user name and email
git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

# Commit the changes and push to the target repository
git add .
git commit -m "sync from git to azure"
git push


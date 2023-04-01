AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
git clone https://github.com/Abdul7777K/test.git
cd test
rm -rf .git

cd ..

GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/Abdul/_git/syncWithgitEshopCommerce" 
git clone $GIT_CMD_REPOSITORY

cp -r test/* syncWithgitEshopCommerce/

cd syncWithgitEshopCommerce

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from git to azure"

git push

$AZUREPAT = $env:AZUREPAT
$AZUSERNAME = $env:AZUSERNAME
$AZUSER_EMAIL = $env:AZUSER_EMAIL
$AZORG = $env:AZORG

git clone https://github.com/Abdul7777K/test.git
cd test
Remove-Item -Recurse .git

cd ..

$GIT_CMD_REPOSITORY = "https://$($env:AZUSERNAME):$($env:AZUREPAT)@dev.azure.com/$($env:AZORG)/Abdul/_git/syncWithgitEshopCommerce"
git clone $GIT_CMD_REPOSITORY

Copy-Item -Recurse test/* syncWithgitEshopCommerce/

cd syncWithgitEshopCommerce

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from git to azure"

git push

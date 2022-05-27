# 仓库地址
repository="git@github.com:xianqiu/mathhs"
# math homework serveice
service_name="mathhs"


# 更新代码
if [ ! -d "${service_name}" ] 
then
    git clone -b main ${repository}
fi
echo ">> Updating ..."
cd ${service_name}
git pull origin main
cd ..
echo ">> Done."


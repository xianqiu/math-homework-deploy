# 仓库地址
repository="git@github.com:xianqiu/mathhs"
# math homework serveice
service_name="mathhs"

# 更新代码
if [ ! -d "${service_name}" ] 
then
    git clone -b main ${repository}
fi

echo ">> Updating web pages ..."
cd ${service_name}
# 将更新取回本地
git fetch --all
# 用远程服务器的origin/main 替换本地、暂存区、版本库
git reset --hard origin/main
# 同步代码 
git pull origin main
cd ..
echo ">> Done."

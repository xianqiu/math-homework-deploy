#!/bin/bash

# 说明(限本地使用).
# 创建 React开发环境，然后从 Github 拉取代码.

#-------#
# 配置项 #
#-------#

# 前端仓库地址
repo_add_front="git@github.com:xianqiu/math-homework-react"
# react
react_app_name="math-homework-react"
react_packages=("antd" "axios")

#--------------#
# 创建React环境 #
#--------------#

if [ -d "${react_app_name}" ] 
then
    echo ">> Fail. ${react_app_name} exists."
    exit
fi

# 创建 
npx create-react-app ${react_app_name}
cd ${react_app_name}
# 添加依赖 
echo "Adding packages >>>"
for p in ${react_packages[*]}
do
    npm add ${p}
    echo "\t [${p}] added."
done
cd ..

#--------------#
# 获取前后端代码 #
#--------------#

# 前端代码
cd ${react_app_name}
# 初始化本地仓库
git init
# 添加远程仓库
git remote add origin ${repo_add_front}
# 将更新取回本地
git fetch --all
# 用远程服务器的origin/main 替换本地、暂存区、版本库
git reset --hard origin/main
# 同步代码 
git pull origin main
cd ..


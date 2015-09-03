#!/bin/bash

function print_help(){
    cat << END_OF_HELP
用法：
  ./install.sh [选项]...
选项：
  -h, --help                  显示帮助信息
  -c, --check-dependence      检查基本依赖
  -i, --install               安装配置文件
  -d, --install-dependence    安装依赖环境
示例：
  ./install.sh -c -i -d
END_OF_HELP
    exit 0
}
if [ $# -eq 0 ];then
    print_help
fi

case $1 in
    -c|--check-dependence)
        echo '' > no_dp
        echo 'checking dependence now......'
        . ./dependence.sh
        for path in $(pwd)/* ; do
            if [[ -d $path ]]; then
                curdir=$(dirname $(readlink -f "$path/dependence.sh"))
                if [[ -r $path/dependence.sh ]]; then
                    . $path/dependence.sh
                fi
                unset cudir
            fi
        done
        if [[ -n `cat $HOME/Profiles/no_dp` ]]; then
            echo "please install dependences"
        else
            echo "-----dependence is OK------"
        fi
        ;;
    -i|--install)
        for path in $(pwd)/* ; do
            if [[ -d $path ]]; then
                curdir=$(dirname $(readlink -f "$path/install.sh"))
                if [[ -r $path/install.sh ]]; then
                    . $path/install.sh
                fi
                unset cudir
            fi
        done
        ;;
    -d|--install-dependence)
        if [[ -n `cat $HOME/Profiles/no_dp` ]]; then
            echo "please install dependences"
            sudo pacman -S $(cat $HOME/Profiles/no_dp)
        else
            echo "-----dependence is OK------"
        fi
        ;;
    -h|--help)
        print_help
        ;;
    *)
        break
esac




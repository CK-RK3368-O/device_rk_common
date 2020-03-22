#!system/bin/sh
#######################################################################
# Author: cuikai
# mail: cuikai@skyworth.com 
# Created Time: 2013年03月26日 星期二 13时59分01秒
#######################################################################
echo "do preinstall job"
a=`getprop persist.sys.preinstalled`
echo "$a"

if [ $a -eq 0 ]; then
    for d in $(busybox find /system/preinstall/  -maxdepth 2  -name "*.apk")
do
    echo "$d"
    /system/bin/sh /system/bin/pm install  $d
done
    setprop persist.sys.preinstalled 1
else
    echo "already installed"
fi

echo "preinstall ok"


#!/vendor/bin/sh
# Uperf Runner
# https://github.com/yc9559/
# Author: Matt Yang
# Version: 20200401

BASEDIR="$(dirname $(readlink -f "$0"))"
SCRIPT_DIR="$BASEDIR/script"

# create busybox symlinks
$BASEDIR/bin/busybox/busybox --install -s $BASEDIR/bin/busybox/

# support vtools
cp -af $SCRIPT_DIR/vtools-powercfg.sh /data/powercfg.sh
cp -af $SCRIPT_DIR/vtools-powercfg.sh /data/powercfg-base.sh
chmod 755 /data/powercfg.sh
chmod 755 /data/powercfg-base.sh

# powercfg path provided by magisk module
echo "sh $SCRIPT_DIR/powercfg_main.sh \"\$1\"" >> /data/powercfg.sh

sh $SCRIPT_DIR/start_injector.sh
sh $SCRIPT_DIR/powercfg_once.sh

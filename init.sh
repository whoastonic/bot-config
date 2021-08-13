#!/bin/bash
set -e

chmod +x ./install.sh &&
chmod +x ./pg/scripts/BOT_PERMS.sh &&
chmod +x ./pg/scripts/BOT_READONLY.sh

sh ./install.sh &&
sh ./pg/scripts/BOT_READONLY.sh &&
sh ./pg/scripts/BOT_PERMS.sh

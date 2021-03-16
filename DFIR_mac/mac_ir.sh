#!/bin/sh

# privacy-i log path
# 1. macOS agent install log
# /usr/local/post_install.log
# /usr/local/preinstall.log
# 2. Privacy-i install path and data dir
# /usr/local/Privacy-i
# 3. Privacy-i web agent log
# /usr/local/Privacy-i/discover/web/log/app.log
# /usr/local/Privacy-i/discover/web/log/console.log
# /usr/local/Privacy-i/discover/ProgramData/log/piagent.log
# 4. Privacy-i login and server connect log
# /usr/local/Privacy-i/discover/ProgramData/log/eventlog/*.dat

# macOS System log


tar cvf ~/Download/User-Library-Logs.tar ~/Library/Logs/
tar cvf ~/Download/Library-Logs.tar /Library/Logs
tar cvf ~/Download/var-log.tar /var/log/
tar cvf /User/usr-local-log.tar /usr/local/


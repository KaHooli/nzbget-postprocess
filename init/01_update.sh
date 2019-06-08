#!/bin/bash
apk update
apk upgrade
git -C /scripts/MP4_Automator/ reset HEAD --hard
git -C /scripts/MP4_Automator/ pull
git -C /scripts/nzbToMedia/ reset HEAD --hard
git -C /scripts/nzbToMedia/ pull
chmod -R 0777 /scripts
chown -R nobody:nogroup /scripts
pip3 install --upgrade pip
pip3 install --upgrade requests
pip3 install --upgrade requests[security]
pip3 install --upgrade requests-cache
pip3 install --upgrade babelfish
pip3 install --upgrade "guessit<2"
pip3 install --upgrade "subliminal<2"
pip3 install --upgrade python-dateutil
pip3 install --upgrade qtfaststart
pip3 uninstall --yes stevedore
pip3 install stevedore==1.19.1

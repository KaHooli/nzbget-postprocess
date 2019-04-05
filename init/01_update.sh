#!/bin/bash
apk update
apk upgrade
git -C /scripts/SMA-TV/ reset HEAD --hard
git -C /scripts/SMA-TV/ pull
git -C /scripts/SMA-Movie/ reset HEAD --hard
git -C /scripts/SMA-Movie/ pull
git -C /scripts/nzbToMedia/ reset HEAD --hard
git -C /scripts/nzbToMedia/ pull
chmod -R 0777 /scripts
chown -R nobody:nogroup /scripts
pip install --upgrade PIP
pip install --upgrade requests
pip install --upgrade requests[security]
pip install --upgrade requests-cache
pip install --upgrade babelfish
pip install --upgrade "guessit<2"
pip install --upgrade "subliminal<2"
pip install --upgrade python-dateutil
pip install --upgrade qtfaststart
pip uninstall --yes stevedore
pip install stevedore==1.19.1

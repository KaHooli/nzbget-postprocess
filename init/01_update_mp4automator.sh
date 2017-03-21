#!/bin/bash
git -C /scripts/MP4_Automator/ reset HEAD --hard
git -C /scripts/MP4_Automator/ pull
chmod 775 -R /scripts
pip install --upgrade PIP
pip install --upgrade requests
pip install --upgrade requests[security]
pip install --upgrade requests-cache
pip install --upgrade babelfish
pip install --upgrade "guessit<2"
pip install --upgrade "subliminal<2"
pip install --upgrade qtfaststart
pip uninstall --yes stevedore
pip install stevedore==1.19.1

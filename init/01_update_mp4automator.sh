#!/bin/bash
git -C /scripts/MP4_Automator/ reset HEAD --hard
git -C /scripts/MP4_Automator/ pull
chmod 775 -R /scripts

#!/bin/bash
# Attiva il controllo remoto su una macchina Ubuntu

killall gconfd-2
gconftool-2 -s -t bool --direct --config-source=xml::/home/rossonet/.gconf/ /desktop/gnome/remote_access/enabled true
gconftool-2 -s -t bool --direct --config-source=xml::/home/rossonet/.gconf/ /desktop/gnome/remote_access/prompt_enabled false

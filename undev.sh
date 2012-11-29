#!/bin/bash
TOTALTERMINAL_RESOURCES='/Library/ScriptingAdditions/TotalTerminal.osax/Contents/Resources/TotalTerminal.bundle/Contents/Resources'
TOTALTERMINAL_RESOURCES_BACKUP='/Library/ScriptingAdditions/TotalTerminal.osax/Contents/Resources/TotalTerminal.bundle/Contents/ResourcesOrig'

if [ -d "$TOTALTERMINAL_RESOURCES" ]; then # is it a folder?
    if [ -L "$TOTALTERMINAL_RESOURCES" ]; then # is is a symlink?
        sudo rm "$TOTALTERMINAL_RESOURCES"
        sudo mv "$TOTALTERMINAL_RESOURCES_BACKUP" "$TOTALTERMINAL_RESOURCES"
        exit
    fi
fi

echo "Failed: TotalTerminal is not installed or in dev mode"

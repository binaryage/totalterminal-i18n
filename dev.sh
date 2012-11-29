#!/bin/bash
TOTALTERMINAL_RESOURCES='/Library/ScriptingAdditions/TotalTerminal.osax/Contents/Resources/TotalTerminal.bundle/Contents/Resources'
TOTALTERMINAL_RESOURCES_BACKUP='/Library/ScriptingAdditions/TotalTerminal.osax/Contents/Resources/TotalTerminal.bundle/Contents/ResourcesOrig'

# need absolute path of the repo's root
dir=`dirname $0`
pushd "$dir" > /dev/null
ROOT=$PWD
popd > /dev/null

if [ ! -d "$TOTALTERMINAL_RESOURCES" ]; then # is it a folder?
    echo "Please install TotalTerminal. Folder '$TOTALTERMINAL_RESOURCES' not found".
    exit
fi

if [ -L "$TOTALTERMINAL_RESOURCES" ]; then # is is a symlink?
    echo "TotalTerminal is already in dev mode. Folder '$TOTALTERMINAL_RESOURCES' is a symlink! Exiting.".
    exit
fi

# ok, we should be safe to do the replacement
sudo mv "$TOTALTERMINAL_RESOURCES" "$TOTALTERMINAL_RESOURCES_BACKUP"
sudo ln -s "$ROOT/plugin" "$TOTALTERMINAL_RESOURCES"
sudo cp "$TOTALTERMINAL_RESOURCES_BACKUP/"*.nib "$TOTALTERMINAL_RESOURCES" # steal compiled nibs from production

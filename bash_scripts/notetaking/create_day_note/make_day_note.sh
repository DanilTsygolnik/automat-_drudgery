#!/bin/bash

DEFAULT_NOTE_NAME=$(date +"%d-%b-%Y-w%W.md")
FILENAME=${3:-$DEFAULT_NOTE_NAME}

NOTE_DIRECTORY=${2:-$PWD}
if ! [[ -d $NOTE_DIRECTORY ]]; then
    mkdir -p $NOTE_DIRECTORY
fi

DAY_NOTE_FULL_PATH="${NOTE_DIRECTORY}/${FILENAME}"

if ! [[ -e $DAY_NOTE_FULL_PATH ]]; then
    touch $DAY_NOTE_FULL_PATH
    NOTE_TEMPLATE_PATH=${1:-""}
    if [[ -n $NOTE_TEMPLATE_PATH && -e $NOTE_TEMPLATE_PATH ]]; then
        cat $NOTE_TEMPLATE_PATH > $DAY_NOTE_FULL_PATH
    fi
fi

$EDITOR $DAY_NOTE_FULL_PATH

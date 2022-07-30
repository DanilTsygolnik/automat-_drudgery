#!/bin/bash

commit_hash_src=${1:-"HEAD"}
url_user_repo="$(git config --get remote.origin.url | sed 's/^.*:\(.*\)\.git/\1/')"
url_commit_hash="$(git rev-parse $commit_hash_src)"
url_commit="https://github.com/${url_user_repo}/commit/${url_commit_hash}"
echo $url_commit | xclip -selection clipboard

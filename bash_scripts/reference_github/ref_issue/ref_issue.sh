#!/bin/bash

num_issues=$(gh issue list | cat | wc -l)
if [[ $num_issues -eq 0 ]]; then
    echo "No issues in repository"; exit 0
fi
issue_id=${1:-$num_issues}
valid_arg='^[0-9]+$'
if ! [[ $issue_id =~ $valid_arg ]] || [[ -z $issue_id ]] ||
    [[ $issue_id -gt $num_issues ]] || [[ $issue_id -lt 1 ]]; then
    echo "You should type a number with the command."\
    "Min number - 1, max number - ${num_issues}. Please, try again."
    exit 1
fi
issue_url=$(gh issue view $issue_id --json url | sed 's/.*"\(https.*\)".*/\1/')
echo $issue_url | xclip -rmlastnl -selection clipboard

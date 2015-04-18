#!/bin/sh

# `echo $CIRCLE_COMPARE_URL | sed 's/^.*\/\([^/]*\)\.\.\.\(.*\)$/\1/'`..`echo $CIRCLE_COMPARE_URL | sed 's/^.*\/\([^/]*\)\.\.\.\(.*\)$/\2/'`
# git log --reverse `git log --merges -n 2 --oneline | tail -1 | grep -o "\([^ ]*\)"`..HEAD --pretty=format:"%s" | sed '/^Merge .*$/d'

git log --reverse `echo $SHIPPABLE_COMMIT_RANGE | sed 's/^\([^.]*\)\.\.\.\(.*\)$/\1/'`\
..`echo $SHIPPABLE_COMMIT_RANGE | sed 's/^\([^.]*\)\.\.\.\(.*\)$/\2/'` --pretty=format:"%s" | sed '/^Merge .*$/d'
#!/bin/sh

export COMMIT_COUNT=`git rev-list --count HEAD`

cp "app/build/outputs/apk/app-debug.apk" "app/build/outputs/apk/$COMMIT_COUNT-app-debug.apk"

export TITLE_TAG=`[[ "$1" = "" ]] && echo "ShippaleTest" || echo "$1"`;
echo "$TITLE_TAG"

curl -s --user 'api:key-b3e9f2ad4703dfd929d29c30760e2dde' \
    https://api.mailgun.net/v2/sandbox94d84e7939014d6ca27590f77d582e06.mailgun.org/messages \
    -F from='The Rocker <postmaster@sandbox94d84e7939014d6ca27590f77d582e06.mailgun.org>' \
    -F to='Tam Phan <tampv92@gmail.com>'\
    -F subject="[$TITLE_TAG] MyChat $COMMIT_COUNT" \
    -F text="`./release_notes.sh`" \
    -F attachment=@"app/build/outputs/apk/$COMMIT_COUNT-app-debug.apk" \

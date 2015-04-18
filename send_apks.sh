#!/bin/sh

export COMMIT_COUNT=`git rev-list --count HEAD`

cp "app/build/outputs/apk/app-debug.apk" "app/build/outputs/apk/$COMMIT_COUNT-app-debug.apk"

export TITLE_TAG=`[[ "$1" = "" ]] && echo "ShippaleTest" || echo "$1"`;
echo "$TITLE_TAG"

curl -s --user 'api:key-608cab8fe064fb580524ddeea2ce5596' \
    https://api.mailgun.net/v3/sandboxa039bc7b423843f8a05dceae76962e29.mailgun.org/messages \
    -F from='Mailgun Sandbox <postmaster@sandboxa039bc7b423843f8a05dceae76962e29.mailgun.org>' \
    -F to='Tam Phan <tampv92@gmail.com>'\
    -F subject="[$TITLE_TAG] MyChat $COMMIT_COUNT" \
    -F text="`./release_notes.sh`" \
    -F attachment=@"app/build/outputs/apk/$COMMIT_COUNT-app-debug.apk" \

PREV_SHA=
while true
do
    CURR_SHA=`ls -l -R --time-style=full-iso /etc/apache2 | sha256sum | cut -d " " -f 1`
    if [ "$PREV_SHA" != "$CURR_SHA" ]
    then
        echo "Config change detected. Reloading"
        apache2ctl graceful
        PREV_SHA=$CURR_SHA
    fi
    sleep 2
done

#!/bin/bash

HANDLERS_DIR="/etc/serf/handlers"

if [ "$SERF_EVENT" = "user" ]; then
    EVENT="user-$SERF_USER_EVENT"
elif [ "$SERF_EVENT" = "query" ]; then
	EVENT="query-$SERF_QUERY_NAME"
else
	EVENT=$SERF_EVENT
fi

## Directory containing all handler scripts for the event.
EVENT_HANDLER_DIR="$HANDLERS_DIR/$EVENT"

## Run all handlers for the event.
for HANDLER_FILE in $(ls $EVENT_HANDLER_DIR | egrep -i "_handler\.[a-z]{2}"); do
	HANDLER="$EVENT_HANDLER_DIR/$HANDLER_FILE"
	[ -f "$HANDLER" -a -x "$HANDLER" ] && exec "$HANDLER" || :	
done 


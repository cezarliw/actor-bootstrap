#!/bin/sh
set -eu

if [ "${ACTOR_ENDPOINT:-}" ]; then
	configFile='/srv/endpoints.json'
	chmod 0777 "$configFile"
	if [ "${ACTOR_ENDPOINT_FALLBACK:-}" ]; then
		echo "{ \"endpoints\": [ \""$ACTOR_ENDPOINT"\", \""$ACTOR_ENDPOINT_FALLBACK"\" ] }" > "$configFile"
	else 
		echo "{ \"endpoints\": [ \""$ACTOR_ENDPOINT"\" ] }" > "$configFile"
	fi
else
	echo "Please, set ACTOR_ENDPOINT environment variable!"
	exit 1
fi

/usr/bin/caddy --conf /etc/Caddyfile
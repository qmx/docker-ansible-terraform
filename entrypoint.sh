#!/bin/sh

set -e

if [ -n "${SSH_AUTH_SOCK}" ]; then
	echo "ssh forwarding won't work properly, run socat locally:"
	echo "socat TCP-LISTEN:<port>,reuseaddr,fork UNIX-CLIENT:\${SSH_AUTH_SOCK}"
	echo "set FORWARD_SSH=yes and FORWARD_PORT=<port> on the container instead"
	exit 1;
fi

if [ "${FORWARD_SSH}" = "yes" ]; then
	if [ -z "${FORWARD_PORT}" ]; then
		echo  "FORWARD_PORT missing"
		exit 1;
	fi
	export SSH_AUTH_SOCK=/tmp/auth.sock
	socat "UNIX-LISTEN:${SSH_AUTH_SOCK},unlink-early,mode=777,fork" "TCP:localhost:${FORWARD_PORT}" &
fi

exec "$@"

#!/bin/sh

app_id="$1"
host_ip="$2"

if test "x$app_id" = "x" -o "x$host_ip" = "x"; then
	echo "Usage:" $( basename $0 ) "<app_id> <host_ip>"
	exit 1
fi

echo "Killing app ..."
wrt-launcher -k "$app_id"

echo "Sleeping for 1 second ..."
sleep 1

echo "Launching app and grabbing port ..."
inspector_port=$( wrt-launcher -s "$app_id" -d | grep '^port: ' | awk '{ print $2; }' )

# Change the ssh command below to reflect your username
ssh -t nix@"$host_ip" bash -c "'( set -x; echo "'"'"hostfwd_remove ::10123"'"'" | socat unix:/tmp/qemu.sock -; echo "'"'"hostfwd_add ::10123-:$inspector_port"'"'" | socat unix:/tmp/qemu.sock - )'"

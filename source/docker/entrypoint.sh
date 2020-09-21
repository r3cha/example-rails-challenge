#!/bin/sh
set -e

mkdir -p /app/tmp/pids
bin/rake db:create
bin/rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

#!/bin/bash

# Exit on fail
set -e

echo ""
echo "⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡"
echo "          Rails - Development Environment"
echo "⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡⚡"

echo ""
echo "Author: Mike Rogers (@MikeRogers0)"

# TODO: Do a check to make sure we have all the ENV attributes we need

# Ensure all gems installed. Add binstubs to bin which has been added to PATH in Dockerfile.
# Bundler caching based on: https://medium.com/@jfroom/docker-compose-3-bundler-caching-in-dev-9ca1e49ac441
echo ""
bundle check || bundle install --jobs 20 --binstubs="$BUNDLE_BIN"
echo "    👍"

# Removing any old pids from a previous run
rm -f tmp/pids/server.pid

if [[ ${@} = *"bundle exec rails s -p"* ]]; then
 . /.docker/full-run.sh 
else
 . /.docker/one-off-task.sh 
fi

# Finally call command issued to the docker service
exec "$@"

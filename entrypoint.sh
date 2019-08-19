#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

bundle exec sidekiq -d -L log/sidekiq.log -e production
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
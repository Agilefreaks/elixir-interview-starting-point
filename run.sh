#!/bin/sh
# Adapted from Alex Kleissner's post, Running a Phoenix 1.3 project with docker-compose
# https://medium.com/@hex337/running-a-phoenix-1-3-project-with-docker-compose-d82ab55e43cf

set -e

# Ensure the app's dependencies are installed
mix deps.get

# Prepare Dialyzer if the project has Dialyxer set up
if mix help dialyzer >/dev/null 2>&1
then
  echo "\nFound Dialyxer: Setting up PLT..."
  mix do deps.compile, dialyzer --plt
else
  echo "\nNo Dialyxer config: Skipping setup..."
fi

#Analysis style code
# Prepare Credo if the project has Credo start code analyze
if mix help credo >/dev/null 2>&1
then
  echo "\nFound Credo: analyzing..."
  mix credo || true
else
  echo "\nNo Credo config: Skipping code analyze..."
fi

# Potentially Set up the database
mix ecto.create
mix ecto.migrate

echo "\n Launching Phoenix web server..."
# Start the phoenix web server

export MY_POD_IP=$(hostname -i)
elixir --name backend@$MY_POD_IP --cookie a1b2c3d4 -S  mix phx.server

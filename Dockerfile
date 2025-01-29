# Elixir + Phoenix

FROM elixir:1.18

# Install debian packages
RUN apt-get update
RUN apt-get install --yes build-essential inotify-tools postgresql-client


# Install Phoenix packages
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.7.7

WORKDIR /app
EXPOSE 4000

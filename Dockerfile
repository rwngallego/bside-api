FROM elixir:1.10.1-slim

SHELL ["/bin/bash", "-c"]

RUN apt-get update

RUN mix local.hex --force
RUN mix local.rebar --force

WORKDIR /app
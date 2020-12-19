# Bside API

![CI/CD](https://github.com/rwngallego/bside/workflows/CI/CD/badge.svg)

> This project is no longer continued.

Runs the API server

## Quick start

To start your Phoenix server:

  * Run docker compose `docker-compose up -d`
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## ECS

- Update the task definition manually

```
aws ecs register-task-definition --region eu-north-1 --cli-input-json file://aws/ecs-task-definition.json
```

## Run as container

```
docker build -t bside .
docker run --network=bside-net -p 4000:4000 -v $(PWD):/app -it bside /bin/bash
```

- Production-like:

```
docker build -f Dockerfile.prod -t bside-prod .
docker run --network bside-net -p 4000:4000 -it bside-prod /bin/bash

# sample values
export DATABASE_URL=ecto://postgres:postgres@postgres/bside_prod
export SECRET_KEY_BASE=cznBoUciJrp5tsTTu0U2LXzWrRdA1hdfqjl0acDuHncRFM5JbE/pqEs2qWwVIHW
/app/bin/bside eval "Bside.Release.migrate"
/app/bin/bside start
```

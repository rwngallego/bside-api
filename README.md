# Bside

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Run as container

```
docker build -t bside .
docker run -it --network=bside-net -v $(PWD):/app bside /bin/bash
```

- Production-like:

```
docker build -f Dockerfile.prod -t bside-prod .
docker run --network bside-net -p 8001:8001 -it bside-prod /bin/bash

# sample values
export DATABASE_URL=ecto://postgres:postgres@postgres/bside_prod
export SECRET_KEY_BASE=cznBoUciJrp5tsTTu0U2LXzWrRdA1hdfqjl0acDuHncRFM5JbE/pqEs2qWwVIHW
/app/bin/bside eval "Bside.Release.migrate"
/app/bin/bside start
```
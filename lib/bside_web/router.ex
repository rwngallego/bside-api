defmodule BsideWeb.Router do
  use BsideWeb, :router

  alias BsideWeb.ApiController

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :graphql do
    plug :accepts, ["json"]
  end

  get "/status", ApiController, :status

  scope "/rest/api/v1", BsideWeb do
    pipe_through :api

    resources "/categories", CategoryController, except: [:new, :edit]
  end

  scope "/" do
    pipe_through :graphql

    # GraphiQL
    if Mix.env() == :dev do
      forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BsideWeb.Schema
    end

    # GraphQL API
    forward "/api", Absinthe.Plug, schema: BsideWeb.Schema
  end
end

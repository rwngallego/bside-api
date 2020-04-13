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

  scope "/api/v1", BsideWeb do
    pipe_through :api

    resources "/categories", CategoryController, except: [:new, :edit]
    resources "/products", ProductController, except: [:new, :edit]
    resources "/variants", VariantController, except: [:new, :edit]
  end

  scope "/graphql" do
    pipe_through :graphql

    # GraphiQL
    if Mix.env() == :dev do
      forward "/explore", Absinthe.Plug.GraphiQL, schema: BsideWeb.Schema
    end

    # GraphQL API
    forward "/v1", Absinthe.Plug, schema: BsideWeb.Schema
  end
end

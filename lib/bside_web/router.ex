defmodule BsideWeb.Router do
  use BsideWeb, :router

  alias BsideWeb.ApiController

  pipeline :api do
    plug :accepts, ["json"]
  end

  get "/status", ApiController, :status

  scope "/api", BsideWeb do
    pipe_through :api

    resources "/categories", CategoryController, except: [:new, :edit]
  end
end

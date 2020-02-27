defmodule BsideWeb.Router do
  use BsideWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BsideWeb do
    pipe_through :api
  end
end

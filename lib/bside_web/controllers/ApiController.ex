defmodule BsideWeb.ApiController do
  @moduledoc """
  Root controller
  """
  use BsideWeb, :controller

  def status(conn, _) do
    conn
    |> put_status(200)
    |> json(%{status: :ok})
  end
end

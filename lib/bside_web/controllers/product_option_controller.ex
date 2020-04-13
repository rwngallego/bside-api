defmodule BsideWeb.ProductOptionController do
  use BsideWeb, :controller

  alias Bside.Catalog
  alias Bside.Catalog.ProductOption

  action_fallback BsideWeb.FallbackController

  def index(conn, _params) do
    product_options = Catalog.list_product_options()
    render(conn, "index.json", product_options: product_options)
  end

  def create(conn, %{"product_option" => product_option_params}) do
    with {:ok, %ProductOption{} = product_option} <-
           Catalog.create_product_option(product_option_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.product_option_path(conn, :show, product_option))
      |> render("show.json", product_option: product_option)
    end
  end

  def show(conn, %{"id" => id}) do
    product_option = Catalog.get_product_option!(id)
    render(conn, "show.json", product_option: product_option)
  end

  def update(conn, %{"id" => id, "product_option" => product_option_params}) do
    product_option = Catalog.get_product_option!(id)

    with {:ok, %ProductOption{} = product_option} <-
           Catalog.update_product_option(product_option, product_option_params) do
      render(conn, "show.json", product_option: product_option)
    end
  end

  def delete(conn, %{"id" => id}) do
    product_option = Catalog.get_product_option!(id)

    with {:ok, %ProductOption{}} <- Catalog.delete_product_option(product_option) do
      send_resp(conn, :no_content, "")
    end
  end
end

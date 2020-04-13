defmodule BsideWeb.ProductOptionControllerTest do
  use BsideWeb.ConnCase

  alias Bside.Catalog
  alias Bside.Catalog.ProductOption

  @create_attrs %{
    description: "some description",
    name: "some name",
    options: %{}
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    options: %{}
  }
  @invalid_attrs %{description: nil, name: nil, options: nil}

  def fixture(:product_option) do
    {:ok, product_option} = Catalog.create_product_option(@create_attrs)
    product_option
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all product_options", %{conn: conn} do
      conn = get(conn, Routes.product_option_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product_option" do
    test "renders product_option when data is valid", %{conn: conn} do
      conn = post(conn, Routes.product_option_path(conn, :create), product_option: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_option_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "options" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_option_path(conn, :create), product_option: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product_option" do
    setup [:create_product_option]

    test "renders product_option when data is valid", %{
      conn: conn,
      product_option: %ProductOption{id: id} = product_option
    } do
      conn =
        put(conn, Routes.product_option_path(conn, :update, product_option),
          product_option: @update_attrs
        )

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_option_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "options" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product_option: product_option} do
      conn =
        put(conn, Routes.product_option_path(conn, :update, product_option),
          product_option: @invalid_attrs
        )

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product_option" do
    setup [:create_product_option]

    test "deletes chosen product_option", %{conn: conn, product_option: product_option} do
      conn = delete(conn, Routes.product_option_path(conn, :delete, product_option))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_option_path(conn, :show, product_option))
      end
    end
  end

  defp create_product_option(_) do
    product_option = fixture(:product_option)
    {:ok, product_option: product_option}
  end
end

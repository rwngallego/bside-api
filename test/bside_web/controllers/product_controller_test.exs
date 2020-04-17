defmodule BsideWeb.ProductControllerTest do
  use BsideWeb.ConnCase

  alias Bside.Catalog
  alias Bside.Catalog.Product

  import Bside.CatalogFactory

  @create_attrs %{
    attributes: %{},
    barcode: "some barcode",
    cost_prices: [],
    depth: %{},
    description: "some description",
    discontinue_on: "2010-04-17T14:00:00Z",
    height: %{},
    is_physical: true,
    is_taxable: true,
    is_visible: true,
    medias: %{},
    meta_description: "some meta_description",
    meta_keywords: "some meta_keywords",
    meta_title: "some meta_title",
    name: "some name",
    options: %{},
    position: 42,
    prices: [],
    sku: "some sku",
    slug: "some slug",
    weight: %{},
    width: %{}
  }
  @update_attrs %{
    attributes: %{},
    barcode: "some updated barcode",
    cost_prices: [],
    depth: %{},
    description: "some updated description",
    discontinue_on: "2011-05-18T15:01:01Z",
    height: %{},
    is_physical: false,
    is_taxable: false,
    is_visible: false,
    medias: %{},
    meta_description: "some updated meta_description",
    meta_keywords: "some updated meta_keywords",
    meta_title: "some updated meta_title",
    name: "some updated name",
    options: %{},
    position: 43,
    prices: [],
    sku: "some updated sku",
    slug: "some updated slug",
    weight: %{},
    width: %{}
  }
  @invalid_attrs %{
    attributes: nil,
    barcode: nil,
    cost_prices: nil,
    depth: nil,
    description: nil,
    discontinue_on: nil,
    height: nil,
    is_physical: nil,
    is_taxable: nil,
    is_visible: nil,
    medias: nil,
    meta_description: nil,
    meta_keywords: nil,
    meta_title: nil,
    options: %{},
    name: nil,
    position: nil,
    prices: nil,
    sku: nil,
    slug: nil,
    weight: nil,
    width: nil
  }

  def fixture(:product) do
    vendor = insert(:vendor)
    attrs = Map.put(@create_attrs, :vendor_id, vendor.id)
    {:ok, product} = Catalog.create_product(attrs)
    product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, Routes.product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create product" do
    test "renders product when data is valid", %{conn: conn} do
      vendor = insert(:vendor)
      create_attrs = Map.put(@create_attrs, :vendor_id, vendor.id)
      conn = post(conn, Routes.product_path(conn, :create), product: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => id,
               "attributes" => [],
               "barcode" => "some barcode",
               "cost_prices" => [],
               "depth" => %{},
               "description" => "some description",
               "discontinue_on" => "2010-04-17T14:00:00Z",
               "height" => %{},
               "is_physical" => true,
               "is_taxable" => true,
               "is_visible" => true,
               "medias" => [],
               "meta_description" => "some meta_description",
               "meta_keywords" => "some meta_keywords",
               "meta_title" => "some meta_title",
               "name" => "some name",
               "options" => [],
               "position" => 42,
               "prices" => [],
               "sku" => "some sku",
               "slug" => "some slug",
               "weight" => %{},
               "width" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.product_path(conn, :create), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update product" do
    setup [:create_product]

    test "renders product when data is valid", %{conn: conn, product: %Product{id: id} = product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.product_path(conn, :show, id))

      assert %{
               "id" => id,
               "attributes" => [],
               "barcode" => "some updated barcode",
               "cost_prices" => [],
               "depth" => %{},
               "description" => "some updated description",
               "discontinue_on" => "2011-05-18T15:01:01Z",
               "height" => %{},
               "is_physical" => false,
               "is_taxable" => false,
               "is_visible" => false,
               "medias" => [],
               "meta_description" => "some updated meta_description",
               "meta_keywords" => "some updated meta_keywords",
               "meta_title" => "some updated meta_title",
               "name" => "some updated name",
               "options" => [],
               "position" => 43,
               "prices" => [],
               "sku" => "some updated sku",
               "slug" => "some updated slug",
               "weight" => %{},
               "width" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, Routes.product_path(conn, :update, product), product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, Routes.product_path(conn, :delete, product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.product_path(conn, :show, product))
      end
    end
  end

  defp create_product(_) do
    product = fixture(:product)
    {:ok, product: product}
  end
end

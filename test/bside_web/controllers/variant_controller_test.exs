defmodule BsideWeb.VariantControllerTest do
  use BsideWeb.ConnCase

  alias Bside.Catalog
  alias Bside.Catalog.Variant

  @create_attrs %{
    attributes: %{},
    barcode: "some barcode",
    cost_price: %{},
    depth: %{},
    description: "some description",
    discontinue_on: "2010-04-17T14:00:00Z",
    height: %{},
    is_visible: true,
    media: %{},
    name: "some name",
    options: %{},
    position: 42,
    price: %{},
    sku: "some sku",
    weight: %{},
    width: %{}
  }
  @update_attrs %{
    attributes: %{},
    barcode: "some updated barcode",
    cost_price: %{},
    depth: %{},
    description: "some updated description",
    discontinue_on: "2011-05-18T15:01:01Z",
    height: %{},
    is_visible: false,
    media: %{},
    name: "some updated name",
    options: %{},
    position: 43,
    price: %{},
    sku: "some updated sku",
    weight: %{},
    width: %{}
  }
  @invalid_attrs %{
    attributes: nil,
    barcode: nil,
    cost_price: nil,
    depth: nil,
    description: nil,
    discontinue_on: nil,
    height: nil,
    is_visible: nil,
    media: nil,
    name: nil,
    options: nil,
    position: nil,
    price: nil,
    sku: nil,
    weight: nil,
    width: nil
  }

  def fixture(:variant) do
    {:ok, variant} = Catalog.create_variant(@create_attrs)
    variant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all variants", %{conn: conn} do
      conn = get(conn, Routes.variant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create variant" do
    test "renders variant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.variant_path(conn, :create), variant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.variant_path(conn, :show, id))

      assert %{
               "id" => id,
               "attributes" => %{},
               "barcode" => "some barcode",
               "cost_price" => %{},
               "depth" => %{},
               "description" => "some description",
               "discontinue_on" => "2010-04-17T14:00:00Z",
               "height" => %{},
               "is_visible" => true,
               "media" => %{},
               "name" => "some name",
               "options" => %{},
               "position" => 42,
               "price" => %{},
               "sku" => "some sku",
               "weight" => %{},
               "width" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.variant_path(conn, :create), variant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update variant" do
    setup [:create_variant]

    test "renders variant when data is valid", %{conn: conn, variant: %Variant{id: id} = variant} do
      conn = put(conn, Routes.variant_path(conn, :update, variant), variant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.variant_path(conn, :show, id))

      assert %{
               "id" => id,
               "attributes" => %{},
               "barcode" => "some updated barcode",
               "cost_price" => %{},
               "depth" => %{},
               "description" => "some updated description",
               "discontinue_on" => "2011-05-18T15:01:01Z",
               "height" => %{},
               "is_visible" => false,
               "media" => %{},
               "name" => "some updated name",
               "options" => %{},
               "position" => 43,
               "price" => %{},
               "sku" => "some updated sku",
               "weight" => %{},
               "width" => %{}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, variant: variant} do
      conn = put(conn, Routes.variant_path(conn, :update, variant), variant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete variant" do
    setup [:create_variant]

    test "deletes chosen variant", %{conn: conn, variant: variant} do
      conn = delete(conn, Routes.variant_path(conn, :delete, variant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.variant_path(conn, :show, variant))
      end
    end
  end

  defp create_variant(_) do
    variant = fixture(:variant)
    {:ok, variant: variant}
  end
end

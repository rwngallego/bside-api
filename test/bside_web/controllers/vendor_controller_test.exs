defmodule BsideWeb.VendorControllerTest do
  use BsideWeb.ConnCase

  alias Bside.Catalog
  alias Bside.Catalog.Vendor

  @create_attrs %{
    media: %{},
    name: "some name"
  }
  @update_attrs %{
    media: %{},
    name: "some updated name"
  }
  @invalid_attrs %{media: nil, name: nil}

  def fixture(:vendor) do
    {:ok, vendor} = Catalog.create_vendor(@create_attrs)
    vendor
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vendors", %{conn: conn} do
      conn = get(conn, Routes.vendor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vendor" do
    test "renders vendor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vendor_path(conn, :create), vendor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.vendor_path(conn, :show, id))

      assert %{
               "id" => id,
               "media" => %{},
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vendor_path(conn, :create), vendor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vendor" do
    setup [:create_vendor]

    test "renders vendor when data is valid", %{conn: conn, vendor: %Vendor{id: id} = vendor} do
      conn = put(conn, Routes.vendor_path(conn, :update, vendor), vendor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.vendor_path(conn, :show, id))

      assert %{
               "id" => id,
               "media" => %{},
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vendor: vendor} do
      conn = put(conn, Routes.vendor_path(conn, :update, vendor), vendor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vendor" do
    setup [:create_vendor]

    test "deletes chosen vendor", %{conn: conn, vendor: vendor} do
      conn = delete(conn, Routes.vendor_path(conn, :delete, vendor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.vendor_path(conn, :show, vendor))
      end
    end
  end

  defp create_vendor(_) do
    vendor = fixture(:vendor)
    {:ok, vendor: vendor}
  end
end

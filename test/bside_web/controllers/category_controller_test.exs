defmodule BsideWeb.CategoryControllerTest do
  use BsideWeb.ConnCase

  alias Bside.Catalog
  alias Bside.Catalog.Category

  @create_attrs %{
    description: "some description",
    image: "some image",
    is_home: true,
    is_main_menu: true,
    is_visible: true,
    meta_description: "some meta_description",
    meta_keywords: "some meta_keywords",
    name: "some name",
    meta_title: "some meta_title",
    parent_id: "7488a646-e31f-11e4-aace-600308960662",
    publish_date: "2010-04-17T14:00:00Z",
    slug: "some slug",
    sort_order: "some sort_order",
    position: 1
  }
  @update_attrs %{
    description: "some updated description",
    image: "some updated image",
    is_home: false,
    is_main_menu: false,
    is_visible: false,
    meta_description: "some updated meta_description",
    meta_keywords: "some updated meta_keywords",
    name: "some updated name",
    meta_title: "some updated meta_title",
    parent_id: "7488a646-e31f-11e4-aace-600308960668",
    publish_date: "2011-05-18T15:01:01Z",
    slug: "some updated slug",
    sort_order: "some updated sort_order",
    position: 2
  }
  @invalid_attrs %{
    description: nil,
    image: nil,
    is_home: nil,
    is_main_menu: nil,
    is_visible: nil,
    meta_description: nil,
    meta_keywords: nil,
    name: nil,
    meta_title: nil,
    parent_id: nil,
    publish_date: nil,
    slug: nil,
    sort_order: nil,
    position: nil
  }

  def fixture(:category) do
    {:ok, category} = Catalog.create_category(@create_attrs)
    category
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categories", %{conn: conn} do
      conn = get(conn, Routes.category_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create category" do
    test "renders category when data is valid", %{conn: conn} do
      conn = post(conn, Routes.category_path(conn, :create), category: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.category_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "image" => "some image",
               "is_home" => true,
               "is_main_menu" => true,
               "is_visible" => true,
               "meta_description" => "some meta_description",
               "meta_keywords" => "some meta_keywords",
               "name" => "some name",
               "meta_title" => "some meta_title",
               "parent_id" => "7488a646-e31f-11e4-aace-600308960662",
               "publish_date" => "2010-04-17T14:00:00Z",
               "slug" => "some slug",
               "sort_order" => "some sort_order",
               "position" => 1
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.category_path(conn, :create), category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update category" do
    setup [:create_category]

    test "renders category when data is valid", %{
      conn: conn,
      category: %Category{id: id} = category
    } do
      conn = put(conn, Routes.category_path(conn, :update, category), category: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.category_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "image" => "some updated image",
               "is_home" => false,
               "is_main_menu" => false,
               "is_visible" => false,
               "meta_description" => "some updated meta_description",
               "meta_keywords" => "some updated meta_keywords",
               "name" => "some updated name",
               "meta_title" => "some updated meta_title",
               "parent_id" => "7488a646-e31f-11e4-aace-600308960668",
               "publish_date" => "2011-05-18T15:01:01Z",
               "slug" => "some updated slug",
               "sort_order" => "some updated sort_order",
               "position" => 2
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, category: category} do
      conn = put(conn, Routes.category_path(conn, :update, category), category: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete category" do
    setup [:create_category]

    test "deletes chosen category", %{conn: conn, category: category} do
      conn = delete(conn, Routes.category_path(conn, :delete, category))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.category_path(conn, :show, category))
      end
    end
  end

  defp create_category(_) do
    category = fixture(:category)
    {:ok, category: category}
  end
end

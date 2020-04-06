defmodule BsideTest.Schema.CatalogTest do
  use BsideWeb.ConnCase
  import Bside.CatalogFactory

  setup do
    [
      categories: insert_list(3, :category)
    ]
  end

  describe "categories" do
    test "get a category by id", %{conn: conn, categories: [category | _]} do
      query = """
      {
        category(id: "#{category.id}") {
          id
          name
          description
          image
        }
      }
      """

      res =
        conn
        |> post("/api", %{query: query})
        |> json_response(200)

      expected = category |> get_values()
      assert res == %{"data" => %{"category" => expected}}
    end

    test "get categories list", %{conn: conn, categories: categories} do
      query = """
      {
        categories {
          id
          name
          description
          image
        }
      }
      """

      res =
        conn
        |> post("/api", %{query: query})
        |> json_response(200)

      expected = category_list(categories)

      assert res == %{"data" => %{"categories" => expected}}
    end

    test "return error when not found", %{conn: conn} do
      query = """
      {
        category(id: "9999") {
          id
        }
      }
      """

      res =
        conn
        |> post("/api", %{query: query})
        |> json_response(200)

      assert nil == res["data"]["category"]
      assert "not_found" == List.first(res["errors"])["message"]
    end
  end

  defp category_list(categories) do
    Enum.map(categories, &get_values/1)
  end

  defp get_values(category) do
    %{
      "name" => category.name,
      "description" => category.description,
      "id" => category.id |> to_string(),
      "image" => category.image
    }
  end
end

defmodule BsideTest.CatalogSchemaTest do
  use BsideWeb.ConnCase
  import Bside.CatalogFactory

  setup do
    [
      categories: insert_list(3, :category)
    ]
  end

  @api_path "/graphql/v1"

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
        |> post(@api_path, %{query: query})
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
        |> post(@api_path, %{query: query})
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
        |> post(@api_path, %{query: query})
        |> json_response(200)

      assert nil == res["data"]["category"]
      assert "not_found" == List.first(res["errors"])["message"]
    end

    test "create category", %{conn: conn} do
      query = """
        mutation {
          createCategory(
            category: {
              name: "Test Category creation",
              description: "Description 1",
              slug: "category",
              pageTitle: "Category 0 title",
              image: "ddd",
              metaKeywords: "sss",
              metaDescription: "sss",
              publishDate: "2020-04-07 10:00:00",
              sortOrder: "eee"
            }
          ) {
            result {
              id,
              name,
              description
            },
            messages {
              field
              message
              template
            },
            successful
          }
        }
      """

      res =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      response = res["data"]["createCategory"]
      assert response["result"]["name"] == "Test Category creation"
      assert response["messages"] == []
      assert response["successful"] == true
    end

    test "return field error", %{conn: conn} do
      query = """
        mutation {
          createCategory(
            category: {
              name: "",
              description: "Description 1",
              slug: "category",
              pageTitle: "Category 0 title",
              image: "ddd",
              metaKeywords: "sss",
              metaDescription: "sss",
              publishDate: "2020-04-07 10:00:00",
              sortOrder: "eee"
            }
          ) {
            result {
              id,
            },
            messages {
              field
              message
              template
            },
            successful
          }
      }
      """

      res =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      response = res["data"]["createCategory"]
      field_error = List.first(response["messages"])

      assert response["result"] == nil

      assert field_error == %{
               "field" => "name",
               "message" => "can't be blank",
               "template" => "can't be blank"
             }

      assert response["successful"] == false
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

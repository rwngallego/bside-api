# defmodule BsideTest.ProductSchemaTest do
#   use BsideWeb.ConnCase
#   import Bside.CatalogFactory

#   setup do
#     [
#       products: insert_list(3, :products)
#     ]
#   end

#   @api_path "/graphql/v1"

#   describe "products" do
#     test "get by id", %{conn: conn, products: [product | _]} do
#       query = """
#       {
#         product(id: "#{product.id}") {
#           id
#           name
#           description
#           image
#         }
#       }
#       """

#       res =
#         conn
#         |> post(@api_path, %{query: query})
#         |> json_response(200)

#       expected = product |> get_values()
#       assert res == %{"data" => %{"product" => expected}}
#     end

#     test "get list", %{conn: conn, products: products} do
#       query = """
#       {
#         products {
#           id
#           name
#           description
#           image
#         }
#       }
#       """

#       res =
#         conn
#         |> post(@api_path, %{query: query})
#         |> json_response(200)

#       expected = product_list(products)

#       assert res == %{"data" => %{"products" => expected}}
#     end

#     test "return error when not found", %{conn: conn} do
#       query = """
#       {
#         product(id: "9999") {
#           id
#         }
#       }
#       """

#       res =
#         conn
#         |> post(@api_path, %{query: query})
#         |> json_response(200)

#       assert nil == res["data"]["product"]
#       assert "not_found" == List.first(res["errors"])["message"]
#     end

#     test "create", %{conn: conn} do
#       query = """
#         mutation {
#           createProduct(
#             product: {
#               name: "Test product creation",
#               description: "Description 1",
#               slug: "product",
#               metaTitle: "product 0 title",
#               image: "ddd",
#               metaKeywords: "sss",
#               metaDescription: "sss",
#               publishDate: "2020-04-07 10:00:00",
#               sortOrder: "eee"
#             }
#           ) {
#             result {
#               id,
#               name,
#               description
#             },
#             messages {
#               field
#               message
#               template
#             },
#             successful
#           }
#         }
#       """

#       res =
#         conn
#         |> post(@api_path, %{query: query})
#         |> json_response(200)

#       response = res["data"]["createProduct"]
#       assert response["result"]["name"] == "Test product creation"
#       assert response["messages"] == []
#       assert response["successful"] == true
#     end

#     test "return field error", %{conn: conn} do
#       query = """
#         mutation {
#           createProduct(
#             product: {
#               name: "",
#               description: "Description 1",
#               slug: "product",
#               metaTitle: "product 0 title",
#               image: "ddd",
#               metaKeywords: "sss",
#               metaDescription: "sss",
#               publishDate: "2020-04-07 10:00:00",
#               sortOrder: "eee"
#             }
#           ) {
#             result {
#               id,
#             },
#             messages {
#               field
#               message
#               template
#             },
#             successful
#           }
#       }
#       """

#       res =
#         conn
#         |> post(@api_path, %{query: query})
#         |> json_response(200)

#       response = res["data"]["createProduct"]
#       field_error = List.first(response["messages"])

#       assert response["result"] == nil

#       assert field_error == %{
#                "field" => "name",
#                "message" => "can't be blank",
#                "template" => "can't be blank"
#              }

#       assert response["successful"] == false
#     end
#   end

#   defp product_list(products) do
#     Enum.map(products, &get_values/1)
#   end

#   defp get_values(product) do
#     %{
#       "name" => product.name,
#       "description" => product.description,
#       "id" => product.id |> to_string(),
#       "image" => product.image
#     }
#   end
# end

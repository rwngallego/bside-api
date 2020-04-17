defmodule BsideTest.ProductSchemaTest do
  use BsideWeb.ConnCase
  import AbsintheErrorPayload.TestHelper
  import Bside.CatalogFactory

  setup do
    [
      products: insert_list(3, :product)
    ]
  end

  @api_path "/graphql/v1"
  @price_fields %{value: :integer, currency: :string}

  describe "products" do
    test "get by id", %{conn: conn, products: [product | _]} do
      query = """
      {
        product(id: "#{product.id}") {
          id
          name
          description
          prices {
            value
            currency
          }
          cost_prices {
            value
            currency
          }
          position
        }
      }
      """

      %{"data" => %{"product" => result}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      fields = %{id: :id, name: :string, description: :string, position: :integer}
      assert_equivalent_graphql(product, result, fields)
      assert_equivalent_graphql(product.prices, result["prices"], @price_fields)
      assert_equivalent_graphql(product.cost_prices, result["cost_prices"], @price_fields)
    end

    test "get list", %{conn: conn, products: products} do
      query = """
      {
        products {
          id
          name
          description
          prices {
            value
            currency
          }
          position
        }
      }
      """

      %{"data" => %{"products" => result}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      fields = %{id: :id, name: :string, description: :string, position: :integer}
      assert_equivalent_graphql(products, result, fields)
      # TODO: assert prices
    end

    test "return error when not found", %{conn: conn} do
      query = """
      {
        product(id: "9999") {
          id
        }
      }
      """

      res =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      assert nil == res["data"]["product"]
      assert "not_found" == List.first(res["errors"])["message"]
    end

    test "create", %{conn: conn} do
      vendor = insert(:vendor)

      query = """
        mutation {
          createProduct(
            product: {
              name: "Test product creation",
              description: "Description 1",
              slug: "product",
              sku: "A00001",
              prices: [{
                value: 1000,
                currency: "SEK"
              }]
              position: 1,
              vendor_id: #{vendor.id}
            }
          ) {
            result {
              id,
              name
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

      %{"data" => %{"createProduct" => response}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      assert response["result"]["name"] == "Test product creation"
      assert response["messages"] == []
      assert response["successful"] == true
    end

    test "return field error", %{conn: conn} do
      vendor = insert(:vendor)

      query = """
        mutation {
          createProduct(
            product: {
              name: "",
              description: "Description 1",
              slug: "product",
              sku: "A00001",
              prices: [{
                value: 1000,
                currency: "SEK"
              }]
              position: 1,
              vendor_id: #{vendor.id}
            }
          ) {
            result {
              id,
              name
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

      %{"data" => %{"createProduct" => response}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

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
end

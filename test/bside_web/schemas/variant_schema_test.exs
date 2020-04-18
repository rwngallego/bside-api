defmodule BsideTest.VariantSchemaTest do
  use BsideWeb.ConnCase
  import AbsintheErrorPayload.TestHelper
  import Bside.CatalogFactory

  setup do
    [
      variants: insert_list(3, :variant)
    ]
  end

  @api_path "/graphql/v1"
  @price_fields %{value: :integer, currency: :string}
  @attribute_fields %{name: :string, value: :string}
  @option_fields %{name: :string}
  @media_fields %{name: :string, source: :string, type: :string}

  describe "variants" do
    test "get by id", %{conn: conn, variants: [variant | _]} do
      query = """
      {
        variant(id: "#{variant.id}") {
          id
          name
          description
          position
          sku
          prices {
            value
            currency
          }
          attributes {
            name
            value
          }
          options {
            name
            options {
              name
              value
            }
          }
          medias {
            name
            url
            type
          }
        }
      }
      """

      %{"data" => %{"variant" => response}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      fields = %{id: :id, name: :string, description: :string, position: :integer, sku: :string}
      assert_equivalent_graphql(variant, response, fields)
      assert_equivalent_graphql(variant.prices, response["prices"], @price_fields)
      assert_equivalent_graphql(variant.attributes, response["attributes"], @attribute_fields)
      assert_equivalent_graphql(variant.options, response["options"], @option_fields)
      assert_equivalent_graphql(variant.medias, response["medias"], @media_fields)
    end

    test "get list", %{conn: conn, variants: variants} do
      query = """
      {
        variants {
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

      %{"data" => %{"variants" => response}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      fields = %{id: :id, name: :string, description: :string, position: :integer}
      assert_equivalent_graphql(variants, response, fields)
    end

    test "return error when not found", %{conn: conn} do
      query = """
      {
        variant(id: "9999") {
          id
        }
      }
      """

      res =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      assert nil == res["data"]["variant"]
      assert "not_found" == List.first(res["errors"])["message"]
    end

    test "create", %{conn: conn} do
      product = insert(:product)

      query = """
        mutation {
          createVariant(
            variant: {
              name: "Test variant creation",
              description: "Description 1",
              sku: "A00001",
              prices: [{
                value: 1000,
                currency: "SEK"
              }]
              position: 1,
              product_id: #{product.id}
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

      %{"data" => %{"createVariant" => response}} =
        conn
        |> post(@api_path, %{query: query})
        |> json_response(200)

      assert response["result"]["name"] == "Test variant creation"
      assert response["messages"] == []
      assert response["successful"] == true
    end

    test "return field error", %{conn: conn} do
      product = insert(:product)

      query = """
        mutation {
          createVariant(
            variant: {
              name: "",
              description: "Description 1",
              sku: "A00001",
              prices: [{
                value: 1000,
                currency: "SEK"
              }]
              position: 1,
              product_id: #{product.id}
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

      %{"data" => %{"createVariant" => response}} =
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

defmodule BsideWeb.Schema do
  @moduledoc """
  Defines the GraphQL schema
  """
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(BsideWeb.Schema.CatalogTypes)

  alias BsideWeb.CatalogResolver

  query do
    @desc "Get a category"
    field :category, :category do
      arg(:id, non_null(:id))
      resolve(&CatalogResolver.get_category/3)
    end

    @desc "Get all the categories"
    field :categories, list_of(:category) do
      resolve(&CatalogResolver.list_categories/3)
    end

    @desc "Get a product"
    field :product, :product do
      arg(:id, non_null(:id))
      resolve(&CatalogResolver.get_product/3)
    end

    @desc "Get all the products"
    field :products, list_of(:product) do
      resolve(&CatalogResolver.list_products/3)
    end

    @desc "Get a variant"
    field :variant, :variant do
      arg(:id, non_null(:id))
      resolve(&CatalogResolver.get_variant/3)
    end

    @desc "Get all the variants"
    field :variants, list_of(:variant) do
      resolve(&CatalogResolver.list_variants/3)
    end
  end

  mutation do
    import_fields(:catalog_mutations)
  end
end

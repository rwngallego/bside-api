defmodule BsideWeb.Schema do
  @moduledoc """
  Defines the GraphQL schema
  """
  use Absinthe.Schema
  import_types(Absinthe.Type.Custom)
  import_types(BsideWeb.Schema.CatalogTypes)

  alias BsideWeb.Resolvers

  query do
    @desc "Get all the categories"
    field :categories, list_of(:category) do
      resolve(&Resolvers.Catalog.list_categories/3)
    end

    @desc "Get a category"
    field :category, :category do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Catalog.get_category/3)
    end
  end
end

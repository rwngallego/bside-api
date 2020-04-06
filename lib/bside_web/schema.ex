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

  mutation do
    field :create_category, :category do
      arg(:name, non_null(:string))
      arg(:description, non_null(:string))
      arg(:image, :string)
      arg(:slug, non_null(:string))
      arg(:page_title, non_null(:string))
      arg(:meta_keywords, :string)
      arg(:meta_description, :string)
      arg(:publish_date, :datetime)
      arg(:sort_order, :string)
      arg(:is_visible, :boolean)
      arg(:is_home, :boolean)
      arg(:is_main_menu, :boolean)

      resolve(&Resolvers.Catalog.create_category/3)
    end
  end
end

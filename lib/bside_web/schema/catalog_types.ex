defmodule BsideWeb.Schema.CatalogTypes do
  @moduledoc """
  Category types
  """
  use Absinthe.Schema.Notation

  @desc "Product categories"
  object :category do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :image, non_null(:string)
    field :page_title, non_null(:string)
    field :slug, non_null(:string)
    field :is_visible, non_null(:boolean)
    field :is_home, non_null(:boolean)
    field :is_main_menu, non_null(:boolean)
  end
end

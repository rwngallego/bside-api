defmodule BsideWeb.Schema.CatalogTypes do
  @moduledoc """
  Category types
  """
  use Absinthe.Schema.Notation
  import AbsintheErrorPayload.Payload

  alias BsideWeb.CatalogResolver

  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  @desc "Product categories"
  object :category do
    field :id, non_null(:id)
    field(:name, non_null(:string))
    field(:description, non_null(:string))
    field(:image, :string)
    field(:slug, non_null(:string))
    field(:meta_title, non_null(:string))
    field(:meta_keywords, :string)
    field(:meta_description, :string)
    field(:publish_date, :naive_datetime)
    field(:sort_order, :string)
    field(:is_visible, :boolean)
    field(:is_home, :boolean)
    field(:is_main_menu, :boolean)
    field(:position, :integer)
  end

  @desc "Editable category fields"
  input_object :create_category_params do
    field(:name, non_null(:string))
    field(:description, non_null(:string))
    field(:image, :string)
    field(:slug, non_null(:string))
    field(:meta_title, non_null(:string))
    field(:meta_keywords, :string)
    field(:meta_description, :string)
    field(:publish_date, :naive_datetime)
    field(:sort_order, :string)
    field(:is_visible, :boolean)
    field(:is_home, :boolean)
    field(:is_main_menu, :boolean)
    field(:position, :integer)
  end

  payload_object(:category_payload, :category)

  # Mutations
  object :category_mutations do
    @desc "Create a new category"
    field :create_category, :category_payload do
      arg(:category, :create_category_params)
      resolve(&CatalogResolver.create_category/3)
      middleware(&build_payload/2)
    end
  end
end

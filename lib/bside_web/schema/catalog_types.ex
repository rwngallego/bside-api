defmodule BsideWeb.Schema.CatalogTypes do
  @moduledoc """
  Category types
  """
  use Absinthe.Schema.Notation
  import AbsintheErrorPayload.Payload

  alias BsideWeb.CatalogResolver

  import_types(AbsintheErrorPayload.ValidationMessageTypes)

  #----------------------------------------------------------------------------
  # Types
  #----------------------------------------------------------------------------

  @desc "Category"
  object :category do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :image, :string
    field :slug, non_null(:string)
    field :meta_title, non_null(:string)
    field :meta_keywords, :string
    field :meta_description, :string
    field :publish_date, :naive_datetime
    field :sort_order, :string
    field :is_visible, :boolean
    field :is_home, :boolean
    field :is_main_menu, :boolean
    field :position, :integer
  end

  @desc "Category input"
  input_object :create_category_params do
    field :name, non_null(:string)
    field :description, non_null(:string)
    field :image, :string
    field :slug, non_null(:string)
    field :meta_title, non_null(:string)
    field :meta_keywords, :string
    field :meta_description, :string
    field :publish_date, :naive_datetime
    field :sort_order, :string
    field :is_visible, :boolean
    field :is_home, :boolean
    field :is_main_menu, :boolean
    field :position, :integer
  end

  @desc "PriceProp"
  object :price_prop do
    field :currency, non_null(:string)
    field :value, non_null(:integer)
  end

  @desc "MediaProp"
  object :media_prop do
    field :name, non_null(:string)
    field :url, non_null(:string)
    field :type, non_null(:string)
  end

  @desc "AttributeProp"
  object :attribute_prop do
    field :name, :string
    field :value, :string
  end

  @desc "OptionValueProp"
  object :option_value_prop do
    field :name, :string
    field :value, :string
  end

  @desc "OptionProp"
  object :option_prop do
    field :name, :string
    field :options, non_null(list_of(:option_value_prop))
  end

  @desc "Product"
  object :product do
    field :id, non_null(:id)
    field :attributes, list_of(:attribute_prop)
    field :description, :string
    field :name, non_null(:string)
    field :prices, list_of(:price_prop)
    field :cost_prices, list_of(:price_prop)
    field :medias, list_of(:media_prop)
    field :options, list_of(:option_prop)
    field :position, non_null(:integer)
    field :sku, non_null(:string)
  end

  @desc "Product input"
  input_object :create_product_params do
    field :name, non_null(:string)
    field :description, :string
    field :slug, non_null(:string)
    field :sku, non_null(:string)
    field :prices, list_of(:price_prop)
    field :cost_prices, list_of(:price_prop)
    field :medias, list_of(:media_prop)
    field :position, non_null(:integer)
    field :vendor_id, non_null(:id)
  end

  @desc "Variants"
  object :variant do
    field :id, non_null(:id)
    field :attributes, list_of(:attribute_prop)
    field :description, :string
    field :medias, list_of(:media_prop)
    field :name, non_null(:string)
    field :options, list_of(:option_prop)
    field :position, non_null(:integer)
    field :prices, list_of(:price_prop)
    field :sku, non_null(:string)
    field :product_id, non_null(:id)
  end

  @desc "Variant input"
  input_object :create_variant_params do
    field :description, :string
    field :medias, list_of(:media_prop)
    field :name, non_null(:string)
    field :options, list_of(:option_prop)
    field :position, non_null(:integer)
    field :prices, list_of(:price_prop)
    field :sku, non_null(:string)
    field :product_id, non_null(:id)
  end

  payload_object(:category_payload, :category)
  payload_object(:product_payload, :product)
  payload_object(:variant_payload, :variant)

  #----------------------------------------------------------------------------
  # Mutations
  #----------------------------------------------------------------------------

  object :catalog_mutations do
    @desc "Create a new category"
    field :create_category, :category_payload do
      arg(:category, :create_category_params)
      resolve(&CatalogResolver.create_category/3)
      middleware(&build_payload/2)
    end

    @desc "Create a new product"
    field :create_product, :product_payload do
      arg(:product, :create_product_params)
      resolve(&CatalogResolver.create_product/3)
      middleware(&build_payload/2)
    end

    @desc "Create a new variant"
    field :create_variant, :variant_payload do
      arg(:variant, :create_variant_params)
      resolve(&CatalogResolver.create_variant/3)
      middleware(&build_payload/2)
    end
  end
end

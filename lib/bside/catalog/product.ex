defmodule Bside.Catalog.Product do
  @moduledoc """
  Product that belongs to one or many categories and has zero or many variants
  """

  use Ecto.Schema
  import Ecto.Changeset
  
  alias Bside.Catalog

  schema "products" do
    field :attributes, :map
    field :barcode, :string
    field :cost_price, :map
    field :depth, :map
    field :description, :string
    field :discontinue_on, :utc_datetime
    field :height, :map
    field :is_physical, :boolean, default: false
    field :is_taxable, :boolean, default: false
    field :is_visible, :boolean, default: false
    field :media, :map
    field :meta_description, :string
    field :meta_keywords, :string
    field :meta_title, :string
    field :name, :string
    field :options, :map
    field :position, :integer
    field :price, :map
    field :sku, :string
    field :slug, :string
    field :weight, :map
    field :width, :map

    has_many(:variants, Catalog.Variant)

    belongs_to(:vendor, Catalog.Vendor)

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [
      :name,
      :description,
      :meta_title,
      :meta_keywords,
      :meta_description,
      :slug,
      :media,
      :sku,
      :barcode,
      :weight,
      :height,
      :width,
      :depth,
      :price,
      :cost_price,
      :attributes,
      :is_taxable,
      :is_visible,
      :is_physical,
      :options,
      :discontinue_on,
      :position,
      :vendor_id
    ])
    |> validate_required([
      :name,
      :description,
      :meta_title,
      :meta_keywords,
      :meta_description,
      :slug,
      :media,
      :sku,
      :barcode,
      :weight,
      :height,
      :width,
      :depth,
      :price,
      :cost_price,
      :attributes,
      :is_taxable,
      :is_visible,
      :is_physical,
      :options,
      :discontinue_on,
      :position,
      :vendor_id
    ])
  end
end

defmodule Bside.Catalog.Product do
  @moduledoc """
  Product that belongs to one or many categories and has zero or many variants
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Bside.Catalog

  schema "products" do
    field :barcode, :string
    field :depth, :map
    field :description, :string
    field :discontinue_on, :utc_datetime
    field :height, :map
    field :is_physical, :boolean, default: false
    field :is_taxable, :boolean, default: false
    field :is_visible, :boolean, default: false
    field :meta_description, :string
    field :meta_keywords, :string
    field :meta_title, :string
    field :name, :string
    field :position, :integer
    field :sku, :string
    field :slug, :string
    field :weight, :map
    field :width, :map

    embeds_many :prices, Catalog.Embedded.PriceProp
    embeds_many :cost_prices, Catalog.Embedded.PriceProp
    embeds_many :medias, Catalog.Embedded.MediaProp
    embeds_many :options, Catalog.Embedded.ProductOptionProp
    embeds_many :attributes, Catalog.Embedded.AttributeProp

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
      :sku,
      :barcode,
      :weight,
      :height,
      :width,
      :depth,
      :is_taxable,
      :is_visible,
      :is_physical,
      :discontinue_on,
      :position,
      :vendor_id
    ])
    |> cast_embed(:prices)
    |> cast_embed(:cost_prices)
    |> cast_embed(:medias)
    |> cast_embed(:options)
    |> cast_embed(:attributes)
    |> validate_required([
      :name,
      :description,
      :slug,
      :sku,
      :prices,
      :position,
      :vendor_id
    ])
    |> foreign_key_constraint(:vendor_id)
  end
end

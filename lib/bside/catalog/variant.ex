defmodule Bside.Catalog.Variant do
  @moduledoc """
  A variant is a product type with options that differ
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Bside.Catalog

  schema "variants" do
    field :barcode, :string
    field :depth, :map
    field :description, :string
    field :discontinue_on, :utc_datetime
    field :height, :map
    field :is_visible, :boolean, default: false
    field :name, :string
    field :position, :integer
    field :sku, :string
    field :weight, :map
    field :width, :map

    embeds_many :prices, Catalog.Embedded.PriceProp
    embeds_many :cost_prices, Catalog.Embedded.PriceProp
    embeds_many :medias, Catalog.Embedded.MediaProp
    embeds_many :options, Catalog.Embedded.ProductOptionProp
    embeds_many :attributes, Catalog.Embedded.AttributeProp

    belongs_to(:product, Catalog.Product)

    timestamps()
  end

  @doc false
  def changeset(variant, attrs) do
    variant
    |> cast(attrs, [
      :name,
      :description,
      :sku,
      :barcode,
      :weight,
      :height,
      :width,
      :depth,
      :is_visible,
      :discontinue_on,
      :position,
      :product_id
    ])
    |> cast_embed(:prices)
    |> cast_embed(:cost_prices)
    |> cast_embed(:medias)
    |> cast_embed(:options)
    |> cast_embed(:attributes)
    |> validate_required([
      :name,
      :description,
      :sku,
      :prices,
      :position,
      :product_id
    ])
    |> foreign_key_constraint(:product_id)
  end
end

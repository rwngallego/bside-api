defmodule Bside.Catalog.Variant do
  @moduledoc """
  A variant is a product type with options that differ
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "variants" do
    field :attributes, :map
    field :barcode, :string
    field :cost_price, :map
    field :depth, :map
    field :description, :string
    field :discontinue_on, :utc_datetime
    field :height, :map
    field :is_visible, :boolean, default: false
    field :media, :map
    field :name, :string
    field :options, :map
    field :position, :integer
    field :price, :map
    field :sku, :string
    field :weight, :map
    field :width, :map

    timestamps()
  end

  @doc false
  def changeset(variant, attrs) do
    variant
    |> cast(attrs, [
      :name,
      :description,
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
      :options,
      :is_visible,
      :discontinue_on,
      :position
    ])
    |> validate_required([
      :name,
      :description,
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
      :options,
      :is_visible,
      :discontinue_on,
      :position
    ])
  end
end

defmodule Bside.Catalog.Embedded.ProductOptionItemProp do
  @moduledoc """
  ProductOptionItemProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :value, :string
    field :image, :string
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [
      :value,
      :image
    ])
    |> validate_required([
      :value,
      :image
    ])
  end
end

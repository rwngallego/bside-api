defmodule Bside.Catalog.Embedded.ProductOptionItemProp do
  @moduledoc """
  ProductOptionItemProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :image, :string
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [
      :name,
      :image
    ])
    |> validate_required([
      :name,
      :image
    ])
  end
end

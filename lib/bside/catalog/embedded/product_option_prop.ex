defmodule Bside.Catalog.Embedded.ProductOptionProp do
  @moduledoc """
  ProductOptionProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [
      :name
    ])
    |> validate_required([
      :name
    ])
  end
end

defmodule Bside.Catalog.Embedded.AttributeProp do
  @moduledoc """
  AttributeProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :name, :string
    field :value, :string
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [
      :name,
      :value
    ])
    |> validate_required([
      :name,
      :value
    ])
  end
end

defmodule Bside.Catalog.Embedded.ProductOptionProp do
  @moduledoc """
  ProductOptionProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Bside.Catalog

  embedded_schema do
    field :description, :string
    field :name, :string

    embeds_many :options, Catalog.Embedded.ProductOptionItemProp
  end

  @doc false
  def changeset(entity, attrs) do
    entity
    |> cast(attrs, [:name, :description])
    |> cast_embed(:options)
    |> validate_required([:name, :description, :options])
  end
end

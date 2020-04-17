defmodule Bside.Catalog.Embedded.PriceProp do
  @moduledoc """
  PriceProp embedded definition
  """
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :value, :integer
    field :currency, :string
  end

  @doc false
  def changeset(price, attrs) do
    price
    |> cast(attrs, [
      :value,
      :currency
    ])
    |> validate_required([
      :value,
      :currency
    ])
  end
end

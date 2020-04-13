defmodule Bside.Catalog.ProductOption do
  @moduledoc """
  Valid options to associate in the variants
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_options" do
    field :description, :string
    field :name, :string
    field :options, :map

    timestamps()
  end

  @doc false
  def changeset(product_option, attrs) do
    product_option
    |> cast(attrs, [:name, :description, :options])
    |> validate_required([:name, :description, :options])
  end
end

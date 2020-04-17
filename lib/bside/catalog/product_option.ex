defmodule Bside.Catalog.ProductOption do
  @moduledoc """
  Valid options to associate in the variants
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Bside.Catalog

  schema "product_options" do
    field :description, :string
    field :name, :string

    embeds_many :options, Catalog.Embedded.ProductOptionItemProp

    timestamps()
  end

  @doc false
  def changeset(product_option, attrs) do
    product_option
    |> cast(attrs, [:name, :description])
    |> cast_embed(:options)
    |> validate_required([:name, :description, :options])
  end
end

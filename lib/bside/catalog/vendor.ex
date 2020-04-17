defmodule Bside.Catalog.Vendor do
  @moduledoc """
  The manufacturer/brand of the product
  """

  use Ecto.Schema
  import Ecto.Changeset

  alias Bside.Catalog

  schema "vendors" do
    field :name, :string

    embeds_many :medias, Catalog.Embedded.MediaProp

    has_many(:products, Catalog.Product)

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name])
    |> cast_embed(:medias)
    |> validate_required([:name])
  end
end

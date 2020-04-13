defmodule Bside.Catalog.Vendor do
  @moduledoc """
  The manufacturer/brand of the product
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "vendors" do
    field :media, :map
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :media])
    |> validate_required([:name, :media])
  end
end

defmodule Bside.Catalog.Category do
  @moduledoc """
  A category is a collection of products.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :description, :string
    field :image, :string
    field :is_home, :boolean, default: false
    field :is_main_menu, :boolean, default: false
    field :is_visible, :boolean, default: false
    field :meta_title, :string
    field :meta_description, :string
    field :meta_keywords, :string
    field :name, :string
    field :parent_id, Ecto.UUID
    field :publish_date, :utc_datetime
    field :slug, :string
    field :sort_order, :string
    field :position, :integer

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [
      :parent_id,
      :name,
      :description,
      :image,
      :slug,
      :meta_title,
      :meta_keywords,
      :meta_description,
      :publish_date,
      :sort_order,
      :is_visible,
      :is_home,
      :is_main_menu,
      :position
    ])
    |> validate_required([
      :name,
      :description,
      :image,
      :slug,
      :meta_title,
      :meta_keywords,
      :meta_description,
      :publish_date,
      :sort_order,
      :is_visible,
      :is_home,
      :is_main_menu,
      :position
    ])
  end
end

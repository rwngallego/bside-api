defmodule Bside.Catalog.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :description, :string
    field :image, :string
    field :is_home, :boolean, default: false
    field :is_main_menu, :boolean, default: false
    field :is_visible, :boolean, default: false
    field :meta_description, :string
    field :meta_keywords, :string
    field :name, :string
    field :page_title, :string
    field :parent_id, Ecto.UUID
    field :publish_date, :utc_datetime
    field :slug, :string
    field :sort_order, :string

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
      :page_title,
      :meta_keywords,
      :meta_description,
      :publish_date,
      :sort_order,
      :is_visible,
      :is_home,
      :is_main_menu
    ])
    |> validate_required([
      :parent_id,
      :name,
      :description,
      :image,
      :slug,
      :page_title,
      :meta_keywords,
      :meta_description,
      :publish_date,
      :sort_order,
      :is_visible,
      :is_home,
      :is_main_menu
    ])
  end
end

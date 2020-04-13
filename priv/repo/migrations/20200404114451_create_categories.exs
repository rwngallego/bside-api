defmodule Bside.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :parent_id, :uuid
      add :name, :string
      add :description, :string
      add :image, :string
      add :slug, :string
      add :meta_title, :string
      add :meta_keywords, :string
      add :meta_description, :string
      add :publish_date, :utc_datetime
      add :sort_order, :string
      add :position, :integer, null: false
      add :is_visible, :boolean, default: false, null: false
      add :is_home, :boolean, default: false, null: false
      add :is_main_menu, :boolean, default: false, null: false

      timestamps()
    end
  end
end

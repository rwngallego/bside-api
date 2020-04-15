defmodule Bside.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :meta_title, :string
      add :meta_keywords, :string
      add :meta_description, :string
      add :slug, :string
      add :media, :map
      add :sku, :string
      add :barcode, :string
      add :weight, :map
      add :height, :map
      add :width, :map
      add :depth, :map
      add :price, :map
      add :cost_price, :map
      add :attributes, :map
      add :options, :map
      add :is_taxable, :boolean, default: false, null: false
      add :is_visible, :boolean, default: false, null: false
      add :is_physical, :boolean, default: false, null: false
      add :discontinue_on, :utc_datetime
      add :position, :integer

      add :vendor_id, references(:vendors, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:products, [:vendor_id])
  end
end

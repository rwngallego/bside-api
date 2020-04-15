defmodule Bside.Repo.Migrations.CreateVariants do
  use Ecto.Migration

  def change do
    create table(:variants) do
      add :name, :string
      add :description, :string
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
      add :is_visible, :boolean, default: false, null: false
      add :discontinue_on, :utc_datetime
      add :position, :integer

      add :product_id, references(:products, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:variants, [:product_id])
  end
end

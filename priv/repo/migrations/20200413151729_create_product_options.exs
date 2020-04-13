defmodule Bside.Repo.Migrations.CreateProductOptions do
  use Ecto.Migration

  def change do
    create table(:product_options) do
      add :name, :string
      add :description, :string
      add :options, :map

      timestamps()
    end
  end
end

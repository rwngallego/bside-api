defmodule BsideWeb.CatalogResolver do
  @moduledoc """
  Catalog resolvers
  """
  alias Bside.Catalog
  alias Bside.Log

  def list_categories(_root, _args, _info) do
    categories = Catalog.list_categories()
    {:ok, categories}
  end

  def get_category(_root, %{id: id}, _info) do
    case Catalog.get_category(id) do
      nil ->
        Log.error("Category not found", %{id: id})
        {:error, :not_found}

      category ->
        {:ok, category}
    end
  end

  def create_category(_root, %{category: category_args}, _info) do
    case Catalog.create_category(category_args) do
      {:ok, category} ->
        {:ok, category}

      error ->
        Log.error("Error creating the category", %{error: error})
        error
    end
  end
end

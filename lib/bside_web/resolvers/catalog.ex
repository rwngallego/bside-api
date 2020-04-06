defmodule BsideWeb.Resolvers.Catalog do
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
    category = Catalog.get_category!(id)
    {:ok, category}
  end

  def create_category(_root, args, _info) do
    case Catalog.create_category(args) do
      {:ok, category} ->
        {:ok, category}

      error ->
        Log.error("Error creating the category", %{error: error})
        {:error, "Could not create category"}
    end
  end
end

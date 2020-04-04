defmodule BsideWeb.Resolvers.Catalog do
  @moduledoc """
  Catalog resolvers
  """
  alias Bside.Catalog

  def list_categories(_root, _args, _info) do
    categories = Catalog.list_categories()
    {:ok, categories}
  end

  def get_category(_root, %{id: id}, _info) do
    category = Catalog.get_category!(id)
    {:ok, category}
  end
end

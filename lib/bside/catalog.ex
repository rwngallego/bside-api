defmodule Bside.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias Bside.Repo

  alias Bside.Catalog.Category

  @doc """
  Returns the list of categories.

  ## Examples

      iex> list_categories()
      [%Category{}, ...]

  """
  def list_categories do
    Repo.all(Category)
  end

  @doc """
  Gets a single category.

  Raises `Ecto.NoResultsError` if the Category does not exist.

  ## Examples

      iex> get_category!(123)
      %Category{}

      iex> get_category!(456)
      ** (Ecto.NoResultsError)

  """
  def get_category!(id), do: Repo.get!(Category, id)

  @doc """
  Gets a single category.

  ## Examples

      iex> get_category(123)
      %Category{}

      iex> get_category(456)
      nil

  """
  def get_category(id), do: Repo.get(Category, id)

  @doc """
  Creates a category.

  ## Examples

      iex> create_category(%{field: value})
      {:ok, %Category{}}

      iex> create_category(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_category(attrs \\ %{}) do
    %Category{}
    |> Category.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a category.

  ## Examples

      iex> update_category(category, %{field: new_value})
      {:ok, %Category{}}

      iex> update_category(category, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_category(%Category{} = category, attrs) do
    category
    |> Category.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a category.

  ## Examples

      iex> delete_category(category)
      {:ok, %Category{}}

      iex> delete_category(category)
      {:error, %Ecto.Changeset{}}

  """
  def delete_category(%Category{} = category) do
    Repo.delete(category)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking category changes.

  ## Examples

      iex> change_category(category)
      %Ecto.Changeset{source: %Category{}}

  """
  def change_category(%Category{} = category) do
    Category.changeset(category, %{})
  end

  alias Bside.Catalog.Product

  @doc """
  Returns the list of products.

  ## Examples

      iex> list_products()
      [%Product{}, ...]

  """
  def list_products do
    Repo.all(Product)
  end

  @doc """
  Gets a single product.

  Raises `Ecto.NoResultsError` if the Product does not exist.

  ## Examples

      iex> get_product!(123)
      %Product{}

      iex> get_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_product!(id), do: Repo.get!(Product, id)

  @doc """
  Creates a product.

  ## Examples

      iex> create_product(%{field: value})
      {:ok, %Product{}}

      iex> create_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a product.

  ## Examples

      iex> update_product(product, %{field: new_value})
      {:ok, %Product{}}

      iex> update_product(product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_product(%Product{} = product, attrs) do
    product
    |> Product.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a product.

  ## Examples

      iex> delete_product(product)
      {:ok, %Product{}}

      iex> delete_product(product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_product(%Product{} = product) do
    Repo.delete(product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking product changes.

  ## Examples

      iex> change_product(product)
      %Ecto.Changeset{source: %Product{}}

  """
  def change_product(%Product{} = product) do
    Product.changeset(product, %{})
  end

  alias Bside.Catalog.Variant

  @doc """
  Returns the list of variants.

  ## Examples

      iex> list_variants()
      [%Variant{}, ...]

  """
  def list_variants do
    Repo.all(Variant)
  end

  @doc """
  Gets a single variant.

  Raises `Ecto.NoResultsError` if the Variant does not exist.

  ## Examples

      iex> get_variant!(123)
      %Variant{}

      iex> get_variant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_variant!(id), do: Repo.get!(Variant, id)

  @doc """
  Creates a variant.

  ## Examples

      iex> create_variant(%{field: value})
      {:ok, %Variant{}}

      iex> create_variant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_variant(attrs \\ %{}) do
    %Variant{}
    |> Variant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a variant.

  ## Examples

      iex> update_variant(variant, %{field: new_value})
      {:ok, %Variant{}}

      iex> update_variant(variant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_variant(%Variant{} = variant, attrs) do
    variant
    |> Variant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a variant.

  ## Examples

      iex> delete_variant(variant)
      {:ok, %Variant{}}

      iex> delete_variant(variant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_variant(%Variant{} = variant) do
    Repo.delete(variant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking variant changes.

  ## Examples

      iex> change_variant(variant)
      %Ecto.Changeset{source: %Variant{}}

  """
  def change_variant(%Variant{} = variant) do
    Variant.changeset(variant, %{})
  end
end

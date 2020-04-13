defmodule Bside.CatalogTest do
  use Bside.DataCase

  alias Bside.Catalog

  describe "categories" do
    alias Bside.Catalog.Category

    @valid_attrs %{
      description: "some description",
      image: "some image",
      is_home: true,
      is_main_menu: true,
      is_visible: true,
      meta_description: "some meta_description",
      meta_keywords: "some meta_keywords",
      name: "some name",
      meta_title: "some meta_title",
      parent_id: "7488a646-e31f-11e4-aace-600308960662",
      publish_date: "2010-04-17T14:00:00Z",
      slug: "some slug",
      sort_order: "some sort_order",
      position: 1
    }
    @update_attrs %{
      description: "some updated description",
      image: "some updated image",
      is_home: false,
      is_main_menu: false,
      is_visible: false,
      meta_description: "some updated meta_description",
      meta_keywords: "some updated meta_keywords",
      name: "some updated name",
      meta_title: "some updated meta_title",
      parent_id: "7488a646-e31f-11e4-aace-600308960668",
      publish_date: "2011-05-18T15:01:01Z",
      slug: "some updated slug",
      sort_order: "some updated sort_order",
      position: 2
    }
    @invalid_attrs %{
      description: nil,
      image: nil,
      is_home: nil,
      is_main_menu: nil,
      is_visible: nil,
      meta_description: nil,
      meta_keywords: nil,
      name: nil,
      meta_title: nil,
      parent_id: nil,
      publish_date: nil,
      slug: nil,
      sort_order: nil,
      position: nil
    }

    def category_fixture(attrs \\ %{}) do
      {:ok, category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_category()

      category
    end

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Catalog.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Catalog.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      assert {:ok, %Category{} = category} = Catalog.create_category(@valid_attrs)
      assert category.description == "some description"
      assert category.image == "some image"
      assert category.is_home == true
      assert category.is_main_menu == true
      assert category.is_visible == true
      assert category.meta_description == "some meta_description"
      assert category.meta_keywords == "some meta_keywords"
      assert category.name == "some name"
      assert category.meta_title == "some meta_title"
      assert category.parent_id == "7488a646-e31f-11e4-aace-600308960662"
      assert category.publish_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert category.slug == "some slug"
      assert category.sort_order == "some sort_order"
      assert category.position == 1
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      assert {:ok, %Category{} = category} = Catalog.update_category(category, @update_attrs)
      assert category.description == "some updated description"
      assert category.image == "some updated image"
      assert category.is_home == false
      assert category.is_main_menu == false
      assert category.is_visible == false
      assert category.meta_description == "some updated meta_description"
      assert category.meta_keywords == "some updated meta_keywords"
      assert category.name == "some updated name"
      assert category.meta_title == "some updated meta_title"
      assert category.parent_id == "7488a646-e31f-11e4-aace-600308960668"
      assert category.publish_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert category.slug == "some updated slug"
      assert category.sort_order == "some updated sort_order"
      assert category.position == 2
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_category(category, @invalid_attrs)
      assert category == Catalog.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Catalog.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Catalog.change_category(category)
    end
  end

  describe "products" do
    alias Bside.Catalog.Product

    @valid_attrs %{
      attributes: %{},
      barcode: "some barcode",
      cost_price: %{},
      depth: %{},
      description: "some description",
      discontinue_on: "2010-04-17T14:00:00Z",
      height: %{},
      is_physical: true,
      is_taxable: true,
      is_visible: true,
      media: %{},
      meta_description: "some meta_description",
      meta_keywords: "some meta_keywords",
      meta_title: "some meta_title",
      name: "some name",
      position: 42,
      price: %{},
      sku: "some sku",
      slug: "some slug",
      weight: %{},
      width: %{}
    }
    @update_attrs %{
      attributes: %{},
      barcode: "some updated barcode",
      cost_price: %{},
      depth: %{},
      description: "some updated description",
      discontinue_on: "2011-05-18T15:01:01Z",
      height: %{},
      is_physical: false,
      is_taxable: false,
      is_visible: false,
      media: %{},
      meta_description: "some updated meta_description",
      meta_keywords: "some updated meta_keywords",
      meta_title: "some updated meta_title",
      name: "some updated name",
      position: 43,
      price: %{},
      sku: "some updated sku",
      slug: "some updated slug",
      weight: %{},
      width: %{}
    }
    @invalid_attrs %{
      attributes: nil,
      barcode: nil,
      cost_price: nil,
      depth: nil,
      description: nil,
      discontinue_on: nil,
      height: nil,
      is_physical: nil,
      is_taxable: nil,
      is_visible: nil,
      media: nil,
      meta_description: nil,
      meta_keywords: nil,
      meta_title: nil,
      name: nil,
      position: nil,
      price: nil,
      sku: nil,
      slug: nil,
      weight: nil,
      width: nil
    }

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalog.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalog.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Catalog.create_product(@valid_attrs)
      assert product.attributes == %{}
      assert product.barcode == "some barcode"
      assert product.cost_price == %{}
      assert product.depth == %{}
      assert product.description == "some description"
      assert product.discontinue_on == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert product.height == %{}
      assert product.is_physical == true
      assert product.is_taxable == true
      assert product.is_visible == true
      assert product.media == %{}
      assert product.meta_description == "some meta_description"
      assert product.meta_keywords == "some meta_keywords"
      assert product.meta_title == "some meta_title"
      assert product.name == "some name"
      assert product.position == 42
      assert product.price == %{}
      assert product.sku == "some sku"
      assert product.slug == "some slug"
      assert product.weight == %{}
      assert product.width == %{}
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Catalog.update_product(product, @update_attrs)
      assert product.attributes == %{}
      assert product.barcode == "some updated barcode"
      assert product.cost_price == %{}
      assert product.depth == %{}
      assert product.description == "some updated description"
      assert product.discontinue_on == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert product.height == %{}
      assert product.is_physical == false
      assert product.is_taxable == false
      assert product.is_visible == false
      assert product.media == %{}
      assert product.meta_description == "some updated meta_description"
      assert product.meta_keywords == "some updated meta_keywords"
      assert product.meta_title == "some updated meta_title"
      assert product.name == "some updated name"
      assert product.position == 43
      assert product.price == %{}
      assert product.sku == "some updated sku"
      assert product.slug == "some updated slug"
      assert product.weight == %{}
      assert product.width == %{}
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_product(product, @invalid_attrs)
      assert product == Catalog.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalog.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalog.change_product(product)
    end
  end
end

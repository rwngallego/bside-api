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
      page_title: "some page_title",
      parent_id: "7488a646-e31f-11e4-aace-600308960662",
      publish_date: "2010-04-17T14:00:00Z",
      slug: "some slug",
      sort_order: "some sort_order"
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
      page_title: "some updated page_title",
      parent_id: "7488a646-e31f-11e4-aace-600308960668",
      publish_date: "2011-05-18T15:01:01Z",
      slug: "some updated slug",
      sort_order: "some updated sort_order"
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
      page_title: nil,
      parent_id: nil,
      publish_date: nil,
      slug: nil,
      sort_order: nil
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
      assert category.page_title == "some page_title"
      assert category.parent_id == "7488a646-e31f-11e4-aace-600308960662"
      assert category.publish_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert category.slug == "some slug"
      assert category.sort_order == "some sort_order"
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
      assert category.page_title == "some updated page_title"
      assert category.parent_id == "7488a646-e31f-11e4-aace-600308960668"
      assert category.publish_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert category.slug == "some updated slug"
      assert category.sort_order == "some updated sort_order"
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
end

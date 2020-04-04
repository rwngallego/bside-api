defmodule BsideWeb.CategoryView do
  use BsideWeb, :view
  alias BsideWeb.CategoryView

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{
      id: category.id,
      parent_id: category.parent_id,
      name: category.name,
      description: category.description,
      image: category.image,
      slug: category.slug,
      page_title: category.page_title,
      meta_keywords: category.meta_keywords,
      meta_description: category.meta_description,
      publish_date: category.publish_date,
      sort_order: category.sort_order,
      is_visible: category.is_visible,
      is_home: category.is_home,
      is_main_menu: category.is_main_menu
    }
  end
end

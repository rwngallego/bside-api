defmodule Bside.CatalogFactory do
  @moduledoc """
  ExMachina Catalog factory
  """
  use ExMachina.Ecto, repo: Bside.Repo

  def category_factory do
    %Bside.Catalog.Category{
      name: sequence(:name, &"Category #{&1}"),
      description: sequence(:category, &"This is the description #{&1}"),
      image: sequence(:image, &"image#{&1}.png"),
      slug: sequence(:slug, &"category-#{&1}"),
      page_title: sequence(:page_title, &"Cateogry #{&1}"),
      meta_keywords: sequence(:meta_keywords, &"Keyword #{&1}"),
      meta_description: sequence(:meta_description, &"Description #{&1}"),
      publish_date: DateTime.utc_now(),
      sort_order: sequence(:sort_order, ["price", "date_added"]),
      is_visible: sequence(:is_visible, [true, true, true, false]),
      is_home: true,
      is_main_menu: true
    }
  end
end

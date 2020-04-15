defmodule Bside.CatalogFactory do
  @moduledoc """
  ExMachina Catalog factory
  """
  use ExMachina.Ecto, repo: Bside.Repo

  alias Bside.Catalog

  def vendor_factory() do
    %Catalog.Vendor{
      name: sequence(:name, &"Vendor #{&1}"),
      media: build_list(2, :media) |> as_list()
    }
  end

  def category_factory do
    %Catalog.Category{
      name: sequence(:name, &"Category #{&1}"),
      description: sequence(:category, &"This is the description #{&1}"),
      image: sequence(:image, &"image#{&1}.png"),
      slug: sequence(:slug, &"category-#{&1}"),
      meta_title: sequence(:meta_title, &"Cateogry #{&1}"),
      meta_keywords: sequence(:meta_keywords, &"Keyword #{&1}"),
      meta_description: sequence(:meta_description, &"Description #{&1}"),
      publish_date: DateTime.utc_now(),
      sort_order: sequence(:sort_order, ["price", "date_added"]),
      is_visible: sequence(:is_visible, [true, true, true, false]),
      is_home: true,
      is_main_menu: true,
      position: sequence(:position, &(&1 + 1))
    }
  end

  def product_factory do
    %Catalog.Product{
      attributes: %{},
      barcode: sequence(:barcode, &"AAA-BBB-CCC-#{&1}#{&1}#{&1}"),
      cost_price: build(:price),
      depth: build(:dimension),
      description: sequence(:category, &"This is the description #{&1}"),
      discontinue_on: DateTime.utc_now(),
      height: build(:dimension),
      is_physical: sequence(:is_physical, [true, false, true]),
      is_taxable: sequence(:is_taxable, [false, false, true]),
      is_visible: sequence(:is_visible, [true, true, false]),
      media: build_list(2, :media) |> as_list(),
      meta_description: sequence(:meta_description, &"This is meta description #{&1}"),
      meta_keywords: sequence(:meta_keywords, ["Cool, Skirt", "Mobile, iPhone", "Printer, Laser"]),
      meta_title: sequence(:meta_title, &"Product meta title #{&1}"),
      name: sequence(:name, &"Product #{&1}"),
      options: %{},
      position: sequence(:position, &(&1 + 1)),
      price: build_list(2, :price) |> as_list(),
      sku: sequence(:sku, &"10000#{&1}"),
      slug: sequence(:slug, &"product-#{&1}"),
      weight: build(:weight),
      width: build(:dimension),
      vendor: build(:vendor)
    }
  end

  def variant_factory() do
    %Catalog.Variant {
      attributes: %{},
      barcode: sequence(:barcode, &"AAA-BBB-CCC-#{&1}#{&1}#{&1}"),
      cost_price: build(:price),
      depth: build(:dimension),
      description: sequence(:category, &"This is the description #{&1}"),
      discontinue_on: DateTime.utc_now(),
      height: build(:dimension),
      is_visible: sequence(:is_visible, [true, true, false]),
      media: build_list(2, :media) |> as_list(),
      name: sequence(:name, &"Product #{&1}"),
      options: %{},
      position: sequence(:position, &(&1 + 1)),
      price: build_list(2, :price) |> as_list(),
      sku: sequence(:sku, &"10000#{&1}"),
      weight: build(:weight),
      width: build(:dimension)
    }
  end

  def product_option_factory() do
    %Catalog.ProductOption{
      name: sequence(:name, &"Option #{&1}"),
      description: sequence(:description, &"Option description #{&1}"),
      options: build_list(3, :option_size) |> as_list()
    }
  end

  def dimension_factory, do:
    %{
      value: :rand.uniform(100),
      unit: sequence(:unit, ["mm", "cm", "dm"])
    }

  def weight_factory, do:
    %{
      value: :rand.uniform(100),
      unit: sequence(:unit, ["gr", "Kg"])
    }

  def media_factory, do:
    %{
      url: sequence(:image, &"image_#{&1}.png"),
      type: "image"
    }

  def price_factory, do:
    %{
      value: :rand.uniform(100) * sequence(:price_value, [1, 10]),
      currency: sequence(:currency, ["SEK", "EUR"])
    }

  def option_size_factory, do:
    %{
      value: sequence(:value, ["XL", "L", "M", "S", "XS"]),
      image: sequence(:image, &"image_#{&1}.png")
    }

  defp as_list(list), do: as_list(list, %{}, 0)
  defp as_list([], acc, _n), do: acc
  defp as_list([h | t], acc, n), do: as_list(t, Map.put(acc, Integer.to_string(n), h), n+1)
end

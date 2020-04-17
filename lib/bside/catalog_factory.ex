defmodule Bside.CatalogFactory do
  @moduledoc """
  ExMachina Catalog factory
  """
  use ExMachina.Ecto, repo: Bside.Repo

  alias Bside.Catalog

  def vendor_factory do
    %Catalog.Vendor{
      name: sequence(:name, &"Vendor #{&1}"),
      medias: build_list(2, :media_prop)
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
      attributes: build_list(2, :attribute_prop),
      barcode: sequence(:barcode, &"AAA-BBB-CCC-#{&1}#{&1}#{&1}"),
      cost_prices: build_list(2, :price),
      depth: build(:dimension),
      description: sequence(:category, &"This is the description #{&1}"),
      discontinue_on: DateTime.utc_now(),
      height: build(:dimension),
      is_physical: sequence(:is_physical, [true, false, true]),
      is_taxable: sequence(:is_taxable, [false, false, true]),
      is_visible: sequence(:is_visible, [true, true, false]),
      medias: build_list(2, :media_prop),
      meta_description: sequence(:meta_description, &"This is meta description #{&1}"),
      meta_keywords:
        sequence(:meta_keywords, ["Cool, Skirt", "Mobile, iPhone", "Printer, Laser"]),
      meta_title: sequence(:meta_title, &"Product meta title #{&1}"),
      name: sequence(:name, &"Product #{&1}"),
      options: build_list(2, :product_option_prop),
      position: sequence(:position, &(&1 + 1)),
      prices: build_list(2, :price),
      sku: sequence(:sku, &"10000#{&1}"),
      slug: sequence(:slug, &"product-#{&1}"),
      weight: build(:weight),
      width: build(:dimension),
      vendor: build(:vendor)
    }
  end

  def variant_factory do
    %Catalog.Variant{
      attributes: build_list(2, :attribute_prop),
      barcode: sequence(:barcode, &"AAA-BBB-CCC-#{&1}#{&1}#{&1}"),
      cost_prices: build_list(2, :price),
      depth: build(:dimension),
      description: sequence(:category, &"This is the description #{&1}"),
      discontinue_on: DateTime.utc_now(),
      height: build(:dimension),
      is_visible: sequence(:is_visible, [true, true, false]),
      medias: build_list(2, :media_prop),
      name: sequence(:name, &"Product #{&1}"),
      options: build_list(2, :variant_option_prop),
      position: sequence(:position, &(&1 + 1)),
      prices: build_list(2, :price),
      sku: sequence(:sku, &"10000#{&1}"),
      weight: build(:weight),
      width: build(:dimension),
      product: build(:product)
    }
  end

  def product_option_factory do
    %Catalog.ProductOption{
      name: sequence(:name, &"Option #{&1}"),
      description: sequence(:description, &"Option description #{&1}"),
      options: build_list(3, :option_size)
    }
  end

  def attribute_prop_factory do
    %{
      name: sequence(:name, &"option-#{&1}"),
      value: sequence(:value, &"value-#{&1}")
    }
  end

  def product_option_prop_factory do
    %{
      name: sequence(:name, &"option-#{&1}")
    }
  end

  def variant_option_prop_factory do
    %{
      name: sequence(:name, &"option-#{&1}"),
      value: sequence(:value, &"value-#{&1}")
    }
  end

  def dimension_factory,
    do: %{
      value: :rand.uniform(100),
      unit: sequence(:unit, ["mm", "cm", "dm"])
    }

  def weight_factory,
    do: %{
      value: :rand.uniform(100),
      unit: sequence(:unit, ["gr", "Kg"])
    }

  def media_prop_factory,
    do: %{
      url: sequence(:image, &"image_#{&1}.png"),
      type: "image"
    }

  def price_factory,
    do: %{
      value: :rand.uniform(100) * sequence(:price_value, [1, 10]),
      currency: sequence(:currency, ["SEK", "EUR"])
    }

  def option_size_factory,
    do: %{
      value: sequence(:value, ["XL", "L", "M", "S", "XS"]),
      image: sequence(:image, &"image_#{&1}.png")
    }

end

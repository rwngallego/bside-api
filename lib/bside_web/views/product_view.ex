defmodule BsideWeb.ProductView do
  use BsideWeb, :view
  alias BsideWeb.ProductView

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      description: product.description,
      meta_title: product.meta_title,
      meta_keywords: product.meta_keywords,
      meta_description: product.meta_description,
      slug: product.slug,
      media: product.media,
      sku: product.sku,
      barcode: product.barcode,
      weight: product.weight,
      height: product.height,
      width: product.width,
      depth: product.depth,
      price: product.price,
      cost_price: product.cost_price,
      attributes: product.attributes,
      is_taxable: product.is_taxable,
      is_visible: product.is_visible,
      is_physical: product.is_physical,
      options: product.options,
      discontinue_on: product.discontinue_on,
      position: product.position
    }
  end
end

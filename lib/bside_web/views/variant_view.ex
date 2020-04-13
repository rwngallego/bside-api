defmodule BsideWeb.VariantView do
  use BsideWeb, :view
  alias BsideWeb.VariantView

  def render("index.json", %{variants: variants}) do
    %{data: render_many(variants, VariantView, "variant.json")}
  end

  def render("show.json", %{variant: variant}) do
    %{data: render_one(variant, VariantView, "variant.json")}
  end

  def render("variant.json", %{variant: variant}) do
    %{
      id: variant.id,
      name: variant.name,
      description: variant.description,
      media: variant.media,
      sku: variant.sku,
      barcode: variant.barcode,
      weight: variant.weight,
      height: variant.height,
      width: variant.width,
      depth: variant.depth,
      price: variant.price,
      cost_price: variant.cost_price,
      attributes: variant.attributes,
      options: variant.options,
      is_visible: variant.is_visible,
      discontinue_on: variant.discontinue_on,
      position: variant.position
    }
  end
end

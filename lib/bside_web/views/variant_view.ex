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
      medias: variant.medias,
      sku: variant.sku,
      barcode: variant.barcode,
      weight: variant.weight,
      height: variant.height,
      width: variant.width,
      depth: variant.depth,
      prices: variant.prices,
      cost_prices: variant.cost_prices,
      attributes: variant.attributes,
      options: variant.options,
      is_visible: variant.is_visible,
      discontinue_on: variant.discontinue_on,
      position: variant.position
    }
  end
end

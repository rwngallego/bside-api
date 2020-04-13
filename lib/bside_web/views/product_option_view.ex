defmodule BsideWeb.ProductOptionView do
  use BsideWeb, :view
  alias BsideWeb.ProductOptionView

  def render("index.json", %{product_options: product_options}) do
    %{data: render_many(product_options, ProductOptionView, "product_option.json")}
  end

  def render("show.json", %{product_option: product_option}) do
    %{data: render_one(product_option, ProductOptionView, "product_option.json")}
  end

  def render("product_option.json", %{product_option: product_option}) do
    %{
      id: product_option.id,
      name: product_option.name,
      description: product_option.description,
      options: product_option.options
    }
  end
end

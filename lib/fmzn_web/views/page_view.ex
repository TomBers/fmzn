defmodule FmznWeb.PageView do
  use FmznWeb, :view

  def currency_format(val) do
    Float.floor(val, 2)
  end

  def image_path(conn, product) do
    if (product.img) do
      product.img
    else
      Routes.static_path(conn, "/images/placeholder-small.png")
    end
  end
end

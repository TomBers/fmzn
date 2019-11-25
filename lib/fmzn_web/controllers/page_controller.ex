defmodule FmznWeb.PageController do
  use FmznWeb, :controller

  alias Fmzn.Resources


  def index(conn, _params) do
    render(conn, "index.html")
  end

  def basket(conn, _params) do
    slugs = Enum.uniq(get_basket(conn))
    products = Resources.find_products(slugs)
    render(conn, "basket.html", products: Enum.shuffle(products))
  end

  def category(conn, %{"category" => category}) do
    products = Resources.find_products_by_category(category)
    render(conn, "products.html", products: Enum.shuffle(products), category: category)
  end

  def get_basket(conn) do
    b = get_session(conn, :basket)
    case b do
      nil -> []
      _ -> b
    end
  end

  def load_products(conn, _params) do
    Fmzn.LoadProducts.run()
    render(conn, "index.html")
  end

end

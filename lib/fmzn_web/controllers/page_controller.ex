defmodule FmznWeb.PageController do
  use FmznWeb, :controller

  alias Fmzn.Resources


  def index(conn, _params) do
    random_products = Resources.find_random_products()
    render(conn, "index.html", random_products: random_products)
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end

  def basket(conn, _params) do
    slugs = Enum.uniq(get_basket(conn))
    products = Resources.find_products(slugs)
    render(conn, "basket.html", products: Enum.shuffle(products))
  end

  def category(conn, %{"category" => category}) do
    products = Resources.find_products_by_category(category) |> Enum.shuffle
    render(conn, "products.html", products: products, category: category)
  end

  def get_basket(conn) do
    b = get_session(conn, :basket)
    case b do
      nil -> []
      _ -> b
    end
  end

  def load_products(conn, _params) do
    prods = Fmzn.LoadProducts.load_json_web()
    render(conn, "insert.html", prods: prods)
  end

end

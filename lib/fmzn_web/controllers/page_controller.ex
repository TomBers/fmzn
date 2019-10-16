defmodule FmznWeb.PageController do
  use FmznWeb, :controller

  alias Fmzn.Resources

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def basket(conn, _params) do
    pids = Enum.uniq(get_basket(conn))
    products = Resources.find_products(pids)
    render(conn, "basket.html", products: products)
  end

  def get_basket(conn) do
    b = get_session(conn, :basket)
    case b do
      nil -> []
      _ -> b
    end
  end
end

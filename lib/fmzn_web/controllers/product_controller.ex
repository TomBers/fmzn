defmodule FmznWeb.ProductController do
  use FmznWeb, :controller

  alias Fmzn.Resources
  alias Fmzn.Resources.Product
  alias Fmzn.Resources.ProductPoints
  alias Fmzn.Resources.Review

  def index(conn, _params) do
    products = Resources.list_products()
    render(conn, "index.html", products: products)
  end


  def show(conn, %{"id" => id}) do
    product = Resources.get_product_by_slug!(id)
    review = %Review{product_id: product.id}
    changeset = Resources.change_review(review)

    random_products = Resources.find_random_products_excluding_this_one(id)

    advert = Resources.get_advert(1)

    render(conn, "show.html", product: product, changeset: changeset, token: get_csrf_token(), advert: advert, random_products: random_products)
  end

  def add_to_basket(conn, %{"product_id" => pid}) do
    product = Resources.get_product_by_slug!(pid)
    b = get_session(conn, :basket)
    shopping_basket = case b do
      nil -> [pid]
      _ -> b ++ [pid]
    end
    put_session(conn, :basket, shopping_basket)
    |> put_flash(:info, "Added to shopping cart successfully.")
    |> redirect(to: Routes.product_path(conn, :show, product.slug))

  end

  def products_json(conn, _params) do
    json(conn, Jason.encode!(Resources.list_products()))
  end

end

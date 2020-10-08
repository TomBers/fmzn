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

  def new(conn, _params) do
    changeset = Resources.change_product(%Product{productpoints: [%ProductPoints{}, %ProductPoints{}, %ProductPoints{}]})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    product_params = Map.put(product_params, "slug", product_params["title"] |> String.downcase |> String.replace(" ", "-"))
    product_params = Map.put(product_params, "discount", Enum.random([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]))

    case Resources.create_product(product_params) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect(changeset)
        render(conn, "new.html", changeset: changeset)
    end
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

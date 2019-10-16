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
    changeset = Resources.change_product(%Product{productpoints: [%ProductPoints{}]})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    case Resources.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = Resources.get_product!(id)
    IO.inspect(product)
    review = %Review{product_id: id}
    changeset = Resources.change_review(review)

    render(conn, "show.html", product: product, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    product = Resources.get_product!(id)
    changeset = Resources.change_product(product)
    render(conn, "edit.html", product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Resources.get_product!(id)

    case Resources.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Resources.get_product!(id)
    {:ok, _product} = Resources.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :index))
  end
end

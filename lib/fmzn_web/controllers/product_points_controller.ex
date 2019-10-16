defmodule FmznWeb.ProductPointsController do
  use FmznWeb, :controller

  alias Fmzn.Resources
  alias Fmzn.Resources.ProductPoints

  def index(conn, _params) do
    productpoints = Resources.list_productpoints()
    render(conn, "index.html", productpoints: productpoints)
  end

  def new(conn, _params) do
    changeset = Resources.change_product_points(%ProductPoints{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"product_points" => product_points_params}) do
    case Resources.create_product_points(product_points_params) do
      {:ok, product_points} ->
        conn
        |> put_flash(:info, "Product points created successfully.")
        |> redirect(to: Routes.product_points_path(conn, :show, product_points))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product_points = Resources.get_product_points!(id)
    render(conn, "show.html", product_points: product_points)
  end

  def edit(conn, %{"id" => id}) do
    product_points = Resources.get_product_points!(id)
    changeset = Resources.change_product_points(product_points)
    render(conn, "edit.html", product_points: product_points, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product_points" => product_points_params}) do
    product_points = Resources.get_product_points!(id)

    case Resources.update_product_points(product_points, product_points_params) do
      {:ok, product_points} ->
        conn
        |> put_flash(:info, "Product points updated successfully.")
        |> redirect(to: Routes.product_points_path(conn, :show, product_points))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product_points: product_points, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product_points = Resources.get_product_points!(id)
    {:ok, _product_points} = Resources.delete_product_points(product_points)

    conn
    |> put_flash(:info, "Product points deleted successfully.")
    |> redirect(to: Routes.product_points_path(conn, :index))
  end
end

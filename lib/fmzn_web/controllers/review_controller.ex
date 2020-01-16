defmodule FmznWeb.ReviewController do
  use FmznWeb, :controller

  alias Fmzn.Resources
  alias Fmzn.Resources.Review


  def new(conn, _params) do
    changeset = Resources.change_review(%Review{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"review" => review_params}) do

    case Resources.create_review(review_params) do
      {:ok, _review} ->
        conn
        |> put_flash(:info, "Review created successfully.")
        |> redirect(to: Routes.product_path(conn, :show, Map.get(review_params, "product_slug")))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    review = Resources.get_review!(id)
    render(conn, "show.html", review: review)
  end

end

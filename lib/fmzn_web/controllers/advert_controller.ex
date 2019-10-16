defmodule FmznWeb.AdvertController do
  use FmznWeb, :controller

  alias Fmzn.Resources
  alias Fmzn.Resources.Advert

  def index(conn, _params) do
    adverts = Resources.list_adverts()
    render(conn, "index.html", adverts: adverts)
  end

  def new(conn, _params) do
    changeset = Resources.change_advert(%Advert{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"advert" => advert_params}) do
    case Resources.create_advert(advert_params) do
      {:ok, advert} ->
        conn
        |> put_flash(:info, "Advert created successfully.")
        |> redirect(to: Routes.advert_path(conn, :show, advert))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    advert = Resources.get_advert!(id)
    render(conn, "show.html", advert: advert)
  end

  def edit(conn, %{"id" => id}) do
    advert = Resources.get_advert!(id)
    changeset = Resources.change_advert(advert)
    render(conn, "edit.html", advert: advert, changeset: changeset)
  end

  def update(conn, %{"id" => id, "advert" => advert_params}) do
    advert = Resources.get_advert!(id)

    case Resources.update_advert(advert, advert_params) do
      {:ok, advert} ->
        conn
        |> put_flash(:info, "Advert updated successfully.")
        |> redirect(to: Routes.advert_path(conn, :show, advert))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", advert: advert, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    advert = Resources.get_advert!(id)
    {:ok, _advert} = Resources.delete_advert(advert)

    conn
    |> put_flash(:info, "Advert deleted successfully.")
    |> redirect(to: Routes.advert_path(conn, :index))
  end
end

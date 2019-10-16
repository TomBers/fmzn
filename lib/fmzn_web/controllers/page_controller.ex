defmodule FmznWeb.PageController do
  use FmznWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule FmznWeb.ShoppingCart do
  import Plug.Conn

  def init(options), do: options


  def call(conn, _) do
    case get_session(conn, :shoping_basket) do
      nil -> put_session(conn, :shoping_basket, [])
      _ -> conn
    end
  end

end

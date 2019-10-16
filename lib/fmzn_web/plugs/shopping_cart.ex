defmodule FmznWeb.ShoppingCart do
  import Plug.Conn

  def init(options), do: options


  def call(conn, _) do
    conn |> assign(:basket, get_basket(conn))
  end

  def get_basket(conn) do
    b = get_session(conn, :basket)
    case b do
      nil -> []
      _ -> b
    end
  end

end

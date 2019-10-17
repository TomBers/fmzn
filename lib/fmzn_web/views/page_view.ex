defmodule FmznWeb.PageView do
  use FmznWeb, :view

  def currency_format(val) do
    Float.floor(val, 2)
  end
end

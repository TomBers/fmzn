defmodule FmznWeb.LayoutView do
  use FmznWeb, :view

  def get_class(request_path, category) do
    if(request_path == "/category/#{category}") do
      'nav-link active'
    else 'nav-link'
    end
  end
end


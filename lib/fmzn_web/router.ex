defmodule FmznWeb.Router do
  use FmznWeb, :router

  alias FmznWeb.ShoppingCart


  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ShoppingCart

  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FmznWeb do
    pipe_through :browser

    resources "/reviews", ReviewController


    get "/", PageController, :index
    get "/first", PageController, :first
    get "/products", ProductController, :index
    get "/products/new", ProductController, :new
    post "/products", ProductController, :create
    get "/products/:id", ProductController, :show
    get "/privacy", PageController, :privacy
    get "/load", PageController, :load_products
    post "/products/addtobasket/:product_id", ProductController, :add_to_basket
    get "/basket", PageController, :basket
    get "/category/:category", PageController, :category
  end

  # Other scopes may use custom stacks.
   scope "/api", FmznWeb do
     pipe_through :api
     get "/products", ProductController, :products_json
     get "/random", ProductController, :get_product
   end
end

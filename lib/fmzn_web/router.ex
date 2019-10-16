defmodule FmznWeb.Router do
  use FmznWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FmznWeb do
    pipe_through :browser

    resources "/products", ProductController
    resources "/productpoints", ProductPointsController
    resources "/reviews", ReviewController
    resources "/adverts", AdvertController


    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", FmznWeb do
  #   pipe_through :api
  # end
end

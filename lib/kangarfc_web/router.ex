defmodule KangarfcWeb.Router do
  use KangarfcWeb, :router

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

  scope "/", KangarfcWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/post/:post_id", PageController, :show
    get "/search", PageController, :search
    get "/ads/new", PageController, :new
    post "/ads/new", PageController, :create
    get "/admin/ads", PageController, :admin
  end

  # Other scopes may use custom stacks.
  # scope "/api", KangarfcWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: KangarfcWeb.Telemetry
    end
  end
end

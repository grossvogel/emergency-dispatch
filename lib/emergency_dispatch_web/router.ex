defmodule EmergencyDispatchWeb.Router do
  use EmergencyDispatchWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EmergencyDispatchWeb do
    pipe_through :browser

    live "/", GameView
  end

  # Other scopes may use custom stacks.
  # scope "/api", EmergencyDispatchWeb do
  #   pipe_through :api
  # end
end

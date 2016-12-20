defmodule PickyBeardPEMVC.Router do
  use PickyBeardPEMVC.Web, :router

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

  scope "/", PickyBeardPEMVC do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/auth/", AuthController do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", PickyBeardPEMVC do
  #   pipe_through :api
  # end
end

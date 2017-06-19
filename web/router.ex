defmodule DiogoApi.Router do
  use DiogoApi.Web, :router

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

  pipeline :api_auth do
    plug :accepts, ["json"] 
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/", DiogoApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/", DiogoApi do
    pipe_through :api

    post "/authentications/signup/local", AuthenticationController, :signup_local
    post "/authentications/signin/local", AuthenticationController, :signin_local
  end

  scope "/", DiogoApi do
    pipe_through :api_auth

    resources "/users", UserController
    resources "/pictures", PictureController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DiogoApi do
  #   pipe_through :api
  # end
end

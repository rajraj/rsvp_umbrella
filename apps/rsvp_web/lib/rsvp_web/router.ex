defmodule RsvpWeb.Router do
  use RsvpWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :authorized do
  #   plug :browser
  #   plug RsvpWeb.AuthorizedPlug
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/events", EventsController, :index
    get "/events/new", EventsController, :new
    post "/events", EventsController, :create
    get "/events/:id", EventsController, :show
    post "/events/:id/reserve", EventsController, :reserve

    get "/login", SessionController, :new
    post "/login", SessionController, :create
  end

  # scope "/events", RsvpWeb do
  #   pipe_through :authorized
  #
  #   get "/", EventsController, :index
  #   get "/new", EventsController, :new
  #   post "/", EventsController, :create
  #   get "/:id", EventsController, :show
  # end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWeb do
  #   pipe_through :api
  # end
end

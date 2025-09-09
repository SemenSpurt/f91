defmodule F91Web.Router do
  use F91Web, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug F91Web.Plugs.AbsintheContext
    plug F91Web.Plugs.Locale, gettext: F91Web.Gettext
  end

  scope "/api" do
    pipe_through :api
    forward "/graphql/editor", Absinthe.Plug.GraphiQL, schema: F91Web.GraphQL.Schema
    forward "/graphql", Absinthe.Plug, schema: F91Web.GraphQL.Schema
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:f91, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: F91Web.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

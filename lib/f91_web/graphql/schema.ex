defmodule F91Web.GraphQL.Schema do
  use Absinthe.Schema
  alias F91Web.GraphQL.Middlewares.HandleErrors

  import_types Absinthe.Plug.Types
  import_types F91Web.GraphQL.Schema.{UUID, JSON, Timestamp, Date, DayOfWeek, Time, Order}
  import_types F91Web.GraphQL.Schema.Directory
  import_types F91Web.GraphQL.Schema.Project


  query do
    import_fields :directory_queries
    import_fields :project_queries
  end


  mutation do
    import_fields :directory_mutations
    import_fields :project_mutations
  end


  def plugins, do: [Absinthe.Middleware.Dataloader | Absinthe.Plugin.defaults()]

  def middleware(middleware, _field, %{identifier: :mutation}) do
    middleware ++ [HandleErrors]
  end

  def middleware(middleware, _field, _object), do: middleware

  def context(ctx),
    do:
      Map.put(
        ctx,
        :loader,
        Dataloader.new()
        |> Dataloader.add_source(:db, Dataloader.Ecto.new(F91.Repo, query: &loader/2))
      )

  def loader(_, %{query: query}), do: query
  def loader(querable, _), do: querable
end

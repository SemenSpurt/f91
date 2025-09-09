defmodule F91Web.GraphQL.Schema.Directory do
  use Absinthe.Schema.Notation

  import Ecto.Query


  object :directory do
    field :id, non_null(:string)
    field :title, non_null(:string)
    field :description, :string
    # field :projects, list_of(:project), resolve:

    field :inserted_at, non_null(:timestamp)
    field :updated_at, non_null(:timestamp)
  end


  object :directory_queries do
    field :list_directories, list_of(:directory) do
      arg :search, :string, default_value: ""
      arg :order_by, :string
      arg :order_by_type, :order_by_type

      resolve fn _, args, _ ->
        {
          :ok,
          F91.Ecto.Directory
          |> where([d], ilike(d.title, ^"%#{args.search}%"))
          |> F91.Utils.Filters.order(F91.Ecto.Directory.__schema__(:fields), args[:order_by], args[:order_by_type] || :desc_nulls_last)
          |> F91.Repo.all()
        }
      end
    end
  end

  object :directory_mutations do
    field :create_directory, :directory do
      arg :title, non_null(:string)
      arg :description, :string

      resolve fn _, args, _ ->
        %F91.Ecto.Directory{}
        |> F91.Ecto.Directory.changeset(args)
        |> F91.Repo.insert()
      end
    end

    field :update_directory, :directory do
      arg :id, non_null(:string)
      arg :title, :string
      arg :description, :string

      resolve fn _, args, _ ->
        F91.Ecto.Directory
        |> F91.Repo.get_by!(id: args.id)
        |> F91.Ecto.Directory.changeset(args)
        |> F91.Repo.update()
      end
    end

    field :delete_directory, non_null(:boolean) do
      arg :id, :string

      resolve fn _, %{id: id} = args, _ ->
        case F91.Ecto.Directory
        |> F91.Repo.get_by!(id: id)
        |> F91.Repo.delete() do
          {:ok, _} -> {:ok, true}
          {:error, _} -> {:error, false}
        end
      end
    end
  end
end

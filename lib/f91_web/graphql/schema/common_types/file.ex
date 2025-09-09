defmodule F91Web.GraphQL.Schema.File do
  use Absinthe.Schema.Notation

  object :file do
    field :name, :string
    field :content, :string
  end
end

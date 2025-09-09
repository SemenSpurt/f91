defmodule F91.Ecto.Directory do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "directories" do
    field :title, :string
    field :description, :string

    has_many :projects, F91.Ecto.Project

    timestamps()
  end

  @doc false
  def changeset(directory, attrs) do
    directory
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
  end
end

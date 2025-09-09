defmodule F91.Ecto.Project do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "projects" do
    field :title, :string

    belongs_to :directory, F91.Ecto.Directory

    has_many :pages, F91.Ecto.Page

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end

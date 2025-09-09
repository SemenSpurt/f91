defmodule F91.Ecto.Page do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pages" do
    field :title, :string
    field :bg_color, :string
    field :bg_transparency, :float
    field :bg_state, :boolean, default: false

    belongs_to :project, F91.Ecto.Project

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [:title, :bg_color, :bg_transparency, :bg_state])
    |> validate_required([:title, :bg_color, :bg_transparency, :bg_state])
  end
end

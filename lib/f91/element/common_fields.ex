defmodule F91.Element.CommonFields do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "common_fields" do
    field :name, :string
    field :rotation, :integer
    field :order, :integer
    field :opacity, :float
    field :loc, {:array, :float}
    field :dims, {:array, :float}
    field :width_type, Ecto.Enum, values: [fill: 0, hug: 1, fixed: 2]
    field :height_type, Ecto.Enum, values: [fill: 0, hug: 1, fixed: 2]
    field :type, Ecto.Enum,
      values: [
        frame: 0,
        rectangle: 1,
        ellipse: 2,
        line: 3,
        arrow: 4,
        image: 5,
        text: 6,
        pencil: 7
      ]

    timestamps()
  end

  @doc false
  def changeset(common_fields, attrs) do
    common_fields
    |> cast(attrs, [
      :name,
      :rotation,
      :order,
      :transparency,
      :loc,
      :dims,
      :width_type,
      :height_type,
      :type
    ])
    |> validate_required([
      :name,
      :rotation,
      :order,
      :transparency,
      :loc,
      :dims,
      :width_type,
      :height_type,
      :type
    ])
  end
end

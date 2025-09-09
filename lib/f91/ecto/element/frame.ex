defmodule F91.Ecto.Element.Frame do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "frames" do
    field :layout_type, Ecto.Enum, values: [absolute: 0, column: 1, row: 2, "row-wrap": 3]
    field :h_align, Ecto.Enum, values: [left: 0, center: 1, right: 2]
    field :v_align, Ecto.Enum, values: [top: 0, center: 1, bottom: 2]
    field :top_pad, :float
    field :bottom_pad, :float
    field :right_pad, :float
    field :left_pad, :float
    field :gap, :float
    field :clip_content, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(frame, attrs) do
    frame
    |> cast(attrs, [:layout_type, :h_align, :v_align, :top_pad, :bottom_pad, :right_pad, :left_pad, :gap, :clip_content])
    |> validate_required([:layout_type, :h_align, :v_align, :top_pad, :bottom_pad, :right_pad, :left_pad, :gap, :clip_content])
  end
end

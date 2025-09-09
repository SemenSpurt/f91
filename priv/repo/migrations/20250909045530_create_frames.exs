defmodule F91.Repo.Migrations.CreateFrames do
  use Ecto.Migration

  def change do
    create table(:frames, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :layout_type, :integer
      add :h_align, :integer
      add :v_align, :integer
      add :top_pad, :float
      add :bottom_pad, :float
      add :right_pad, :float
      add :left_pad, :float
      add :gap, :float
      add :clip_content, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end

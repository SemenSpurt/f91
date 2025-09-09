defmodule F91.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :bg_color, :string
      add :bg_transparency, :float
      add :bg_state, :boolean, default: false, null: false

      add :project_id, references(:projects, type: :binary_id)

      timestamps()
    end
  end
end

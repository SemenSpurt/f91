defmodule F91.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string

      add :directory_id, references(:directories, type: :binary_id)

      timestamps()
    end
  end
end

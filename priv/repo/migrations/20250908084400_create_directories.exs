defmodule F91.Repo.Migrations.CreateDirectories do
  use Ecto.Migration

  def change do
    create table(:directories, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :description, :string

      timestamps()
    end
  end
end

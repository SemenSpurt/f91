defmodule F91.Repo.Migrations.CreateCommonFields do
  use Ecto.Migration

  def change do
    create table(:common_fields, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :rotation, :integer
      add :order, :integer
      add :opacity, :float
      add :loc, {:array, :float}
      add :dims, {:array, :float}
      add :width_type, :integer
      add :height_type, :integer
      add :type, :integer

      timestamps()
    end
  end
end

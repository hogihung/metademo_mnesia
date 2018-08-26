defmodule MetademoMnesia.Repo.Migrations.CreateHosts do
  use Ecto.Migration

  def change do
    create table(:hosts) do
      add :hostname, :string
      add :description, :string
      add :cpu_count, :integer
      add :total_memory, :integer
      add :total_disk, :integer
      add :created_by, :string
      add :updated_by, :string
      add :is_active, :integer

      timestamps()
    end

  end
end

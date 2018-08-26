defmodule MetademoMnesia.Repo.Migrations.CreateHosts do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:hosts, engine: :ordered_set) do
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

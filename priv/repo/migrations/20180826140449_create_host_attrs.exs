defmodule MetademoMnesia.Repo.Migrations.CreateHostAttrs do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:host_attrs, engine: :ordered_set) do
      add :name, :string
      add :value, :string
      add :created_by, :string
      add :updated_by, :string
      add :is_active, :integer
      add :host_id, references(:hosts)

      timestamps()
    end

  end
end

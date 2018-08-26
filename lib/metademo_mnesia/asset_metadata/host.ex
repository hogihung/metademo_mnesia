defmodule MetademoMnesia.AssetMetadata.Host do
  use Ecto.Schema
  import Ecto.Changeset


  schema "hosts" do
    field :cpu_count, :integer
    field :created_by, :string
    field :description, :string
    field :hostname, :string
    field :is_active, :integer
    field :total_disk, :integer
    field :total_memory, :integer
    field :updated_by, :string

    timestamps()
    has_many :host_attrs, MetademoMnesia.AssetMetadata.HostAttr
  end

  @doc false
  def changeset(host, attrs) do
    host
    |> cast(attrs, [:hostname, :description, :cpu_count, :total_memory, :total_disk, :created_by, :updated_by, :is_active])
    |> validate_required([:hostname, :description, :cpu_count, :total_memory, :total_disk, :created_by, :updated_by, :is_active])
  end
end

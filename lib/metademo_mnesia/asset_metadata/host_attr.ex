defmodule MetademoMnesia.AssetMetadata.HostAttr do
  use Ecto.Schema
  import Ecto.Changeset


  schema "host_attrs" do
    field :created_by, :string
    field :is_active, :integer
    field :name, :string
    field :updated_by, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(host_attr, attrs) do
    host_attr
    |> cast(attrs, [:name, :value, :created_by, :updated_by, :is_active])
    |> validate_required([:name, :value, :created_by, :updated_by, :is_active])
  end
end

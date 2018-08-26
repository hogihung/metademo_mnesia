defmodule MetademoMnesia.AssetMetadataTest do
  use MetademoMnesia.DataCase

  alias MetademoMnesia.AssetMetadata

  describe "hosts" do
    alias MetademoMnesia.AssetMetadata.Host

    @valid_attrs %{cpu_count: 42, created_by: "some created_by", description: "some description", hostname: "some hostname", is_active: 42, total_disk: 42, total_memory: 42, updated_by: "some updated_by"}
    @update_attrs %{cpu_count: 43, created_by: "some updated created_by", description: "some updated description", hostname: "some updated hostname", is_active: 43, total_disk: 43, total_memory: 43, updated_by: "some updated updated_by"}
    @invalid_attrs %{cpu_count: nil, created_by: nil, description: nil, hostname: nil, is_active: nil, total_disk: nil, total_memory: nil, updated_by: nil}

    def host_fixture(attrs \\ %{}) do
      {:ok, host} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AssetMetadata.create_host()

      host
    end

    test "list_hosts/0 returns all hosts" do
      host = host_fixture()
      assert AssetMetadata.list_hosts() == [host]
    end

    test "get_host!/1 returns the host with given id" do
      host = host_fixture()
      assert AssetMetadata.get_host!(host.id) == host
    end

    test "create_host/1 with valid data creates a host" do
      assert {:ok, %Host{} = host} = AssetMetadata.create_host(@valid_attrs)
      assert host.cpu_count == 42
      assert host.created_by == "some created_by"
      assert host.description == "some description"
      assert host.hostname == "some hostname"
      assert host.is_active == 42
      assert host.total_disk == 42
      assert host.total_memory == 42
      assert host.updated_by == "some updated_by"
    end

    test "create_host/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AssetMetadata.create_host(@invalid_attrs)
    end

    test "update_host/2 with valid data updates the host" do
      host = host_fixture()
      assert {:ok, host} = AssetMetadata.update_host(host, @update_attrs)
      assert %Host{} = host
      assert host.cpu_count == 43
      assert host.created_by == "some updated created_by"
      assert host.description == "some updated description"
      assert host.hostname == "some updated hostname"
      assert host.is_active == 43
      assert host.total_disk == 43
      assert host.total_memory == 43
      assert host.updated_by == "some updated updated_by"
    end

    test "update_host/2 with invalid data returns error changeset" do
      host = host_fixture()
      assert {:error, %Ecto.Changeset{}} = AssetMetadata.update_host(host, @invalid_attrs)
      assert host == AssetMetadata.get_host!(host.id)
    end

    test "delete_host/1 deletes the host" do
      host = host_fixture()
      assert {:ok, %Host{}} = AssetMetadata.delete_host(host)
      assert_raise Ecto.NoResultsError, fn -> AssetMetadata.get_host!(host.id) end
    end

    test "change_host/1 returns a host changeset" do
      host = host_fixture()
      assert %Ecto.Changeset{} = AssetMetadata.change_host(host)
    end
  end

  describe "host_attrs" do
    alias MetademoMnesia.AssetMetadata.HostAttr

    @valid_attrs %{created_by: "some created_by", is_active: 42, name: "some name", updated_by: "some updated_by", value: "some value"}
    @update_attrs %{created_by: "some updated created_by", is_active: 43, name: "some updated name", updated_by: "some updated updated_by", value: "some updated value"}
    @invalid_attrs %{created_by: nil, is_active: nil, name: nil, updated_by: nil, value: nil}

    def host_attr_fixture(attrs \\ %{}) do
      {:ok, host_attr} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AssetMetadata.create_host_attr()

      host_attr
    end

    test "list_host_attrs/0 returns all host_attrs" do
      host_attr = host_attr_fixture()
      assert AssetMetadata.list_host_attrs() == [host_attr]
    end

    test "get_host_attr!/1 returns the host_attr with given id" do
      host_attr = host_attr_fixture()
      assert AssetMetadata.get_host_attr!(host_attr.id) == host_attr
    end

    test "create_host_attr/1 with valid data creates a host_attr" do
      assert {:ok, %HostAttr{} = host_attr} = AssetMetadata.create_host_attr(@valid_attrs)
      assert host_attr.created_by == "some created_by"
      assert host_attr.is_active == 42
      assert host_attr.name == "some name"
      assert host_attr.updated_by == "some updated_by"
      assert host_attr.value == "some value"
    end

    test "create_host_attr/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AssetMetadata.create_host_attr(@invalid_attrs)
    end

    test "update_host_attr/2 with valid data updates the host_attr" do
      host_attr = host_attr_fixture()
      assert {:ok, host_attr} = AssetMetadata.update_host_attr(host_attr, @update_attrs)
      assert %HostAttr{} = host_attr
      assert host_attr.created_by == "some updated created_by"
      assert host_attr.is_active == 43
      assert host_attr.name == "some updated name"
      assert host_attr.updated_by == "some updated updated_by"
      assert host_attr.value == "some updated value"
    end

    test "update_host_attr/2 with invalid data returns error changeset" do
      host_attr = host_attr_fixture()
      assert {:error, %Ecto.Changeset{}} = AssetMetadata.update_host_attr(host_attr, @invalid_attrs)
      assert host_attr == AssetMetadata.get_host_attr!(host_attr.id)
    end

    test "delete_host_attr/1 deletes the host_attr" do
      host_attr = host_attr_fixture()
      assert {:ok, %HostAttr{}} = AssetMetadata.delete_host_attr(host_attr)
      assert_raise Ecto.NoResultsError, fn -> AssetMetadata.get_host_attr!(host_attr.id) end
    end

    test "change_host_attr/1 returns a host_attr changeset" do
      host_attr = host_attr_fixture()
      assert %Ecto.Changeset{} = AssetMetadata.change_host_attr(host_attr)
    end
  end
end

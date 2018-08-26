defmodule MetademoMnesiaWeb.HostControllerTest do
  use MetademoMnesiaWeb.ConnCase

  alias MetademoMnesia.AssetMetadata
  alias MetademoMnesia.AssetMetadata.Host

  @create_attrs %{cpu_count: 42, created_by: "some created_by", description: "some description", hostname: "some hostname", is_active: 42, total_disk: 42, total_memory: 42, updated_by: "some updated_by"}
  @update_attrs %{cpu_count: 43, created_by: "some updated created_by", description: "some updated description", hostname: "some updated hostname", is_active: 43, total_disk: 43, total_memory: 43, updated_by: "some updated updated_by"}
  @invalid_attrs %{cpu_count: nil, created_by: nil, description: nil, hostname: nil, is_active: nil, total_disk: nil, total_memory: nil, updated_by: nil}

  def fixture(:host) do
    {:ok, host} = AssetMetadata.create_host(@create_attrs)
    host
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all hosts", %{conn: conn} do
      conn = get conn, host_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create host" do
    test "renders host when data is valid", %{conn: conn} do
      conn = post conn, host_path(conn, :create), host: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, host_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cpu_count" => 42,
        "created_by" => "some created_by",
        "description" => "some description",
        "hostname" => "some hostname",
        "is_active" => 42,
        "total_disk" => 42,
        "total_memory" => 42,
        "updated_by" => "some updated_by"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, host_path(conn, :create), host: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update host" do
    setup [:create_host]

    test "renders host when data is valid", %{conn: conn, host: %Host{id: id} = host} do
      conn = put conn, host_path(conn, :update, host), host: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, host_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cpu_count" => 43,
        "created_by" => "some updated created_by",
        "description" => "some updated description",
        "hostname" => "some updated hostname",
        "is_active" => 43,
        "total_disk" => 43,
        "total_memory" => 43,
        "updated_by" => "some updated updated_by"}
    end

    test "renders errors when data is invalid", %{conn: conn, host: host} do
      conn = put conn, host_path(conn, :update, host), host: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete host" do
    setup [:create_host]

    test "deletes chosen host", %{conn: conn, host: host} do
      conn = delete conn, host_path(conn, :delete, host)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, host_path(conn, :show, host)
      end
    end
  end

  defp create_host(_) do
    host = fixture(:host)
    {:ok, host: host}
  end
end

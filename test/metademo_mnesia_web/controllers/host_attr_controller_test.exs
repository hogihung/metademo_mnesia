defmodule MetademoMnesiaWeb.HostAttrControllerTest do
  use MetademoMnesiaWeb.ConnCase

  alias MetademoMnesia.AssetMetadata
  alias MetademoMnesia.AssetMetadata.HostAttr

  @create_attrs %{created_by: "some created_by", is_active: 42, name: "some name", updated_by: "some updated_by", value: "some value"}
  @update_attrs %{created_by: "some updated created_by", is_active: 43, name: "some updated name", updated_by: "some updated updated_by", value: "some updated value"}
  @invalid_attrs %{created_by: nil, is_active: nil, name: nil, updated_by: nil, value: nil}

  def fixture(:host_attr) do
    {:ok, host_attr} = AssetMetadata.create_host_attr(@create_attrs)
    host_attr
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all host_attrs", %{conn: conn} do
      conn = get conn, host_attr_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create host_attr" do
    test "renders host_attr when data is valid", %{conn: conn} do
      conn = post conn, host_attr_path(conn, :create), host_attr: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, host_attr_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "created_by" => "some created_by",
        "is_active" => 42,
        "name" => "some name",
        "updated_by" => "some updated_by",
        "value" => "some value"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, host_attr_path(conn, :create), host_attr: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update host_attr" do
    setup [:create_host_attr]

    test "renders host_attr when data is valid", %{conn: conn, host_attr: %HostAttr{id: id} = host_attr} do
      conn = put conn, host_attr_path(conn, :update, host_attr), host_attr: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, host_attr_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "created_by" => "some updated created_by",
        "is_active" => 43,
        "name" => "some updated name",
        "updated_by" => "some updated updated_by",
        "value" => "some updated value"}
    end

    test "renders errors when data is invalid", %{conn: conn, host_attr: host_attr} do
      conn = put conn, host_attr_path(conn, :update, host_attr), host_attr: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete host_attr" do
    setup [:create_host_attr]

    test "deletes chosen host_attr", %{conn: conn, host_attr: host_attr} do
      conn = delete conn, host_attr_path(conn, :delete, host_attr)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, host_attr_path(conn, :show, host_attr)
      end
    end
  end

  defp create_host_attr(_) do
    host_attr = fixture(:host_attr)
    {:ok, host_attr: host_attr}
  end
end

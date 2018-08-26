defmodule MetademoMnesiaWeb.HostAttrController do
  use MetademoMnesiaWeb, :controller

  alias MetademoMnesia.AssetMetadata
  alias MetademoMnesia.AssetMetadata.HostAttr

  action_fallback MetademoMnesiaWeb.FallbackController

  def index(conn, _params) do
    host_attrs = AssetMetadata.list_host_attrs()
    render(conn, "index.json", host_attrs: host_attrs)
  end

  def create(conn, %{"host_attr" => host_attr_params}) do
    with {:ok, %HostAttr{} = host_attr} <- AssetMetadata.create_host_attr(host_attr_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", host_attr_path(conn, :show, host_attr))
      |> render("show.json", host_attr: host_attr)
    end
  end

  def show(conn, %{"id" => id}) do
    host_attr = AssetMetadata.get_host_attr!(id)
    render(conn, "show.json", host_attr: host_attr)
  end

  def update(conn, %{"id" => id, "host_attr" => host_attr_params}) do
    host_attr = AssetMetadata.get_host_attr!(id)

    with {:ok, %HostAttr{} = host_attr} <- AssetMetadata.update_host_attr(host_attr, host_attr_params) do
      render(conn, "show.json", host_attr: host_attr)
    end
  end

  def delete(conn, %{"id" => id}) do
    host_attr = AssetMetadata.get_host_attr!(id)
    with {:ok, %HostAttr{}} <- AssetMetadata.delete_host_attr(host_attr) do
      send_resp(conn, :no_content, "")
    end
  end
end

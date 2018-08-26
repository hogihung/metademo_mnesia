defmodule MetademoMnesiaWeb.HostAttrView do
  use MetademoMnesiaWeb, :view
  alias MetademoMnesiaWeb.HostAttrView

  def render("index.json", %{host_attrs: host_attrs}) do
    %{data: render_many(host_attrs, HostAttrView, "host_attr.json")}
  end

  def render("show.json", %{host_attr: host_attr}) do
    %{data: render_one(host_attr, HostAttrView, "host_attr.json")}
  end

  def render("host_attr.json", %{host_attr: host_attr}) do
    %{id: host_attr.id,
      name: host_attr.name,
      value: host_attr.value,
      created_by: host_attr.created_by,
      updated_by: host_attr.updated_by,
      is_active: host_attr.is_active}
  end
end

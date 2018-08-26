defmodule MetademoMnesiaWeb.HostView do
  use MetademoMnesiaWeb, :view
  alias MetademoMnesiaWeb.HostView

  def render("index.json", %{hosts: hosts}) do
    %{data: render_many(hosts, HostView, "host.json")}
  end

  def render("show.json", %{host: host}) do
    %{data: render_one(host, HostView, "host.json")}
  end

  def render("host.json", %{host: host}) do
    %{id: host.id,
      hostname: host.hostname,
      description: host.description,
      cpu_count: host.cpu_count,
      total_memory: host.total_memory,
      total_disk: host.total_disk,
      created_by: host.created_by,
      updated_by: host.updated_by,
      is_active: host.is_active}
  end
end

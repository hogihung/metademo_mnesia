defmodule MetademoMnesiaWeb.PageController do
  use MetademoMnesiaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

defmodule EmergencyDispatchWeb.PageController do
  use EmergencyDispatchWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule ElixircrudWeb.PageController do
  use ElixircrudWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

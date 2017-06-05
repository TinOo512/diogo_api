defmodule DiogoApi.PageController do
  use DiogoApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

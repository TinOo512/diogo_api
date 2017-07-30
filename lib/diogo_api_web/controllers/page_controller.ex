defmodule DiogoApiWeb.PageController do
  use DiogoApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

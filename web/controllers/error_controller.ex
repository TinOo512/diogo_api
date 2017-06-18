defmodule DiogoApi.ErrorController do
  use DiogoApi.Web, :controller

  # handle the case where no authenticated user
  # was found
  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> render(DiogoApi.ErrorView, "401.json")
  end
end

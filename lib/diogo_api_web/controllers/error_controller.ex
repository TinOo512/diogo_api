defmodule DiogoApiWeb.ErrorController do
  use DiogoApiWeb, :controller

  # handle the case where no authenticated user
  # was found
  def unauthenticated(conn, _params) do
    conn
    |> put_status(401)
    |> render(DiogoApiWeb.ErrorView, "401.json")
  end
end

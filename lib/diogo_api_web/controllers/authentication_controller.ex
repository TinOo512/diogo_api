defmodule DiogoApiWeb.AuthenticationController do
  import Plug.Conn
  use DiogoApiWeb, :controller

  alias DiogoApi.Users.User
  alias DiogoApiWeb.Authentication

  def signin_local(conn, params) do
    case User.find_and_confirm_password(params) do
      {:ok, user} ->
        new_conn = Guardian.Plug.api_sign_in(conn, user)
        jwt = Guardian.Plug.current_token(new_conn)
        {:ok, claims} = Guardian.Plug.claims(new_conn)
        exp = Map.get(claims, "exp")

        new_conn
        |> put_resp_header("authorization", "Bearer #{jwt}")
        |> put_resp_header("x-expires", "#{exp}")
        |> render("signin_local.json", user: user, jwt: jwt, exp: exp)
      {:error} ->
        conn
        |> put_status(401)
        |> render(DiogoApiWeb.ErrorView, "error.json",
          code: 401,
          message: "not_authorized",
          description: "Not authorized to login")
    end
  end

  def signup_local(conn, _params) do
    authentications = Repo.all(Authentication)
    render(conn, "index.json", authentications: authentications)
  end
end

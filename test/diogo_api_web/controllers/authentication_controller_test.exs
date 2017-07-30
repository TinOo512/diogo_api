defmodule DiogoApiWeb.AuthenticationControllerTest do
  use DiogoApiWeb.ConnCase

  alias DiogoApiWeb.Authentication
  
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
end

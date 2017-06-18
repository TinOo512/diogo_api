defmodule DiogoApi.AuthenticationControllerTest do
  use DiogoApi.ConnCase

  alias DiogoApi.Authentication
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end
end

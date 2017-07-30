defmodule DiogoApiWeb.PictureControllerTest do
  use DiogoApiWeb.ConnCase

  alias DiogoApi.Pictures.Picture
  
  @valid_attrs %{description: "some content", location___country: "some content", location___country_code: "some content", location___state: "some content", location__city: "some content", date_taken: "some content", name: "some content", photo_url: "some content", tags: "some content", type: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, picture_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    picture = Repo.insert! %Picture{}
    conn = get conn, picture_path(conn, :show, picture)
    assert json_response(conn, 200)["data"] == %{"id" => picture.id,
      "location___country_code" => picture.location___country_code,
      "location___country" => picture.location___country,
      "location___state" => picture.location___state,
      "location__city" => picture.location__city,
      "date_taken" => picture.date_taken,
      "name" => picture.name,
      "description" => picture.description,
      "photo_url" => picture.photo_url,
      "type" => picture.type,
      "tags" => picture.tags}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, picture_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, picture_path(conn, :create), picture: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Picture, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, picture_path(conn, :create), picture: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    picture = Repo.insert! %Picture{}
    conn = put conn, picture_path(conn, :update, picture), picture: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Picture, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    picture = Repo.insert! %Picture{}
    conn = put conn, picture_path(conn, :update, picture), picture: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    picture = Repo.insert! %Picture{}
    conn = delete conn, picture_path(conn, :delete, picture)
    assert response(conn, 204)
    refute Repo.get(Picture, picture.id)
  end
end

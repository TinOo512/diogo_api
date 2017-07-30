defmodule DiogoApi.PictureTest do
  use DiogoApi.DataCase

  alias DiogoApi.Pictures.Picture

  @valid_attrs %{description: "some content", location___country: "some content", location___country_code: "some content", location___state: "some content", location__city: "some content", date_taken: "some content", name: "some content", photo_url: "some content", tags: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Picture.changeset(%Picture{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Picture.changeset(%Picture{}, @invalid_attrs)
    refute changeset.valid?
  end
end

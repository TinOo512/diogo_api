defmodule DiogoApiWeb.PictureController do
  use DiogoApiWeb, :controller

  alias DiogoApi.Pictures.Picture

  def index(conn, _params) do
    pictures = Repo.all(Picture)
    render(conn, "index.json", pictures: pictures)
  end

  def create(conn, %{"picture" => picture_params}) do
    changeset = Picture.changeset(%Picture{}, picture_params)

    case Repo.insert(changeset) do
      {:ok, picture} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", picture_path(conn, :show, picture))
        |> render("show.json", picture: picture)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DiogoApiWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    picture = Repo.get!(Picture, id)
    render(conn, "show.json", picture: picture)
  end

  def update(conn, %{"id" => id, "picture" => picture_params}) do
    picture = Repo.get!(Picture, id)
    changeset = Picture.changeset(picture, picture_params)

    case Repo.update(changeset) do
      {:ok, picture} ->
        render(conn, "show.json", picture: picture)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DiogoApiWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    picture = Repo.get!(Picture, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(picture)

    send_resp(conn, :no_content, "")
  end
end

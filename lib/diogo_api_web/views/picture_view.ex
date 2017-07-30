defmodule DiogoApiWeb.PictureView do
  use DiogoApiWeb, :view

  def render("index.json", %{pictures: pictures}) do
    %{data: render_many(pictures, DiogoApiWeb.PictureView, "picture.json")}
  end

  def render("show.json", %{picture: picture}) do
    %{data: render_one(picture, DiogoApiWeb.PictureView, "picture.json")}
  end

  def render("picture.json", %{picture: picture}) do
    %{id: picture.id,
      location___country_code: picture.location___country_code,
      location___country: picture.location___country,
      location___state: picture.location___state,
      location__city: picture.location__city,
      date_taken: picture.date_taken,
      name: picture.name,
      description: picture.description,
      photo_url: picture.photo_url,
      type: picture.type,
      tags: picture.tags}
  end
end

defmodule DiogoApi.UserView do
  use DiogoApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, DiogoApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, DiogoApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      name: user.name}
  end
end

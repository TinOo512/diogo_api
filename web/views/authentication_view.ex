defmodule DiogoApi.AuthenticationView do
  use DiogoApi.Web, :view

  def render("signin_local.json", %{user: user, jwt: jwt, exp: exp}) do
    %{id: user.id,
      jwt: jwt,
      exp: exp}
  end
end

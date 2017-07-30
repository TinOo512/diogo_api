defmodule DiogoApiWeb.AuthenticationView do
  use DiogoApiWeb, :view

  def render("signin_local.json", %{user: user, jwt: jwt, exp: exp}) do
    %{id: user.id,
      jwt: jwt,
      exp: exp}
  end
end

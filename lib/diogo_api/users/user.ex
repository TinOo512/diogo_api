defmodule DiogoApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias DiogoApi.Repo
  alias DiogoApi.Users.User

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true   
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  def find_and_confirm_password(%{"email" => email, "password" => password}) do
    user = Repo.get_by(User, email: email)
    cond do
      user && checkpw(password, user.password_hash) ->
        { :ok, user }
      user ->
        { :error }
      true ->
        dummy_checkpw() #used to make user enumeration more difficult
        { :error }
    end
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :name])
    |> validate_required([:email, :password, :name])
  end

  def create_changeset(struct, params \\ %{}) do
    struct
    |> changeset(params)
    |> validate_length(:password, min: 6)
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, 
          Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset  
    end
  end
end

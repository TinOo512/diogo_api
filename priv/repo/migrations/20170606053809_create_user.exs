defmodule DiogoApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :text
      add :password_hash, :text
      add :name, :text

      timestamps(type: :timestamptz)
    end

    create unique_index(:users, [:email])
  end
end

defmodule DiogoApi.Repo.Migrations.CreatePicture do
  use Ecto.Migration

  def change do
    create table(:pictures) do
      add :location___country_code, :text
      add :location___country, :text
      add :location___state, :text
      add :location__city, :text
      add :date_taken, :timestamptz
      add :name, :text
      add :description, :text
      add :photo_url, :text
      add :type, :text
      add :tags, :text

      timestamps(type: :timestamptz)
    end

  end
end

defmodule DiogoApi.Picture do
  use DiogoApi.Web, :model

  schema "pictures" do
    field :location___country_code, :string
    field :location___country, :string
    field :location___state, :string
    field :location__city, :string
    field :date_taken, Ecto.DateTime
    field :name, :string
    field :description, :string
    field :photo_url, :string
    field :type, :string
    field :tags, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:location___country_code, :location___country, :location___state, :location__city, :date_taken, :name, :description, :photo_url, :type, :tags])
    |> validate_required([:location___country_code, :location___country, :location___state, :location__city, :date_taken, :name, :description, :photo_url, :type, :tags])
  end
end

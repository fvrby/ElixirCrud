defmodule Elixircrud.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :apellido, :string
    field :comuna, :string
    field :direccion, :string
    field :edad, :integer
    field :fecha_nacimiento, :date
    field :nombre, :string
    field :region, :string
    field :rut, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nombre, :apellido, :edad, :fecha_nacimiento, :rut, :direccion, :comuna, :region])
    |> validate_required([:nombre, :apellido, :edad, :fecha_nacimiento, :rut, :direccion, :comuna, :region])
  end
end

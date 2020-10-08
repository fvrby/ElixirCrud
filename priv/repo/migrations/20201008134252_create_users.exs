defmodule Elixircrud.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nombre, :string
      add :apellido, :string
      add :edad, :integer
      add :fecha_nacimiento, :date
      add :rut, :string
      add :direccion, :string
      add :comuna, :string
      add :region, :string

      timestamps()
    end

  end
end

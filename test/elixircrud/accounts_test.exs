defmodule Elixircrud.AccountsTest do
  use Elixircrud.DataCase

  alias Elixircrud.Accounts

  describe "users" do
    alias Elixircrud.Accounts.User

    @valid_attrs %{apellido: "some apellido", comuna: "some comuna", direccion: "some direccion", edad: 42, fecha_nacimiento: ~D[2010-04-17], nombre: "some nombre", region: "some region", rut: "some rut"}
    @update_attrs %{apellido: "some updated apellido", comuna: "some updated comuna", direccion: "some updated direccion", edad: 43, fecha_nacimiento: ~D[2011-05-18], nombre: "some updated nombre", region: "some updated region", rut: "some updated rut"}
    @invalid_attrs %{apellido: nil, comuna: nil, direccion: nil, edad: nil, fecha_nacimiento: nil, nombre: nil, region: nil, rut: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.apellido == "some apellido"
      assert user.comuna == "some comuna"
      assert user.direccion == "some direccion"
      assert user.edad == 42
      assert user.fecha_nacimiento == ~D[2010-04-17]
      assert user.nombre == "some nombre"
      assert user.region == "some region"
      assert user.rut == "some rut"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.apellido == "some updated apellido"
      assert user.comuna == "some updated comuna"
      assert user.direccion == "some updated direccion"
      assert user.edad == 43
      assert user.fecha_nacimiento == ~D[2011-05-18]
      assert user.nombre == "some updated nombre"
      assert user.region == "some updated region"
      assert user.rut == "some updated rut"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end

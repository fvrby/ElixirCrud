defmodule Elixircrud.Repo do
  use Ecto.Repo,
    otp_app: :elixircrud,
    adapter: Ecto.Adapters.Postgres
end

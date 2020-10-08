# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :elixircrud,
  ecto_repos: [Elixircrud.Repo]

# Configures the endpoint
config :elixircrud, ElixircrudWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "sPCYyZ7YQ86ZUcc78wUr6wfAnCA7ZZnz2PVoMi5rvctq2zTmuRM7QujiU5pRhw64",
  render_errors: [view: ElixircrudWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elixircrud.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

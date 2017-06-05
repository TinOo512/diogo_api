# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :diogo_api,
  ecto_repos: [DiogoApi.Repo]

# Configures the endpoint
config :diogo_api, DiogoApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pnrgNxdtGu78mvyYzsYA5nXQQGDd4MPnkupoNOtBetF3Sjr/kS062vXmxawDk2+c",
  render_errors: [view: DiogoApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DiogoApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

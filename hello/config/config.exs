# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hello,
  ecto_repos: [Hello.Repo]

# Configures the endpoint
config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qSN57bn1KVZ4l7o3B+W6MA+s7zP4+IFI9H+uoMFwTsOM3KR3W9eEWoQXY2OoiJzQ",
  render_errors: [view: HelloWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Hello.PubSub,
  live_view: [signing_salt: "6/q5RJOJ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

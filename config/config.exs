# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :emergency_dispatch, EmergencyDispatchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9cIZOFu//0S5Vr0l1maKE9HCPjLDq9k8UxCB9Bb8lebC9bpL60FMiCc6cXWRbrcz",
  render_errors: [view: EmergencyDispatchWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EmergencyDispatch.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    # TOOO: if this were real you'd want to use a real secret in prod
    signing_salt: "rHD0SYm0aDun/ZukdFhCPZ5swh2iGgCAdrngiiwaTnQMqyaT2sRE/SB9LEht5Qhp"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

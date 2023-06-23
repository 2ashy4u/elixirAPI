# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :project,
  ecto_repos: [Project.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :project, ProjectWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: ProjectWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Project.PubSub,
  live_view: [signing_salt: "SRd3WWx6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :project, ProjectWeb.Auth.Guardian,
  issuer: "project",
  secret_key: "aP4Dllh10ysYq5trb45DQrMNnT93L519DCJXQ8R4/1rAZxpOGNzXnWUmZLZYT2PD"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

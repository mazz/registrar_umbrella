# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :registrar,
  ecto_repos: [Registrar.Repo]

# config :registrar, Registrar.Repo,
#   username: "postgres",
#   password: "postgres",
#   database: "registrar_dev",
#   hostname: "postgres",
#   pool: 10

config :registrar_web,
  ecto_repos: [Registrar.Repo],
  generators: [context_app: :registrar]

# config :registrar, Registrar.Repo,
#   username: "postgres",
#   password: "postgres",
#   database: "registrar_devv",
#   hostname: "postgres",
#   pool_size: 10


# Configures the endpoint
config :registrar_web, RegistrarWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PV4tK6d7I3TTaygeCuaFSaZuQgmO6Lz9twMo5GSVDn4TW2+R2/ycQnzBx/20TfBt",
  render_errors: [view: RegistrarWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: RegistrarWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

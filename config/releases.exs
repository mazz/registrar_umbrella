import Config

# config :registrar,
#   stripe_api_base_url: System.fetch_env!("STRIPE_BASE_URL"),
#   stripe_api_key: System.fetch_env!("STRIPE_SECRET_KEY"),

# config :registrar_web,
#   learn_base_url: System.fetch_env!("LEARN_OAUTH_BASE_URL"),
#   learn_client_id: System.fetch_env!("LEARN_OAUTH_CLIENT_ID"),
#   learn_client_secret: System.fetch_env!("LEARN_OAUTH_CLIENT_SECRET"),

# Configures the endpoint
config :registrar_web, RegistrarWeb.Endpoint,
  secret_key_base: System.fetch_env!("SECRET_KEY_BASE")

config :registrar, Registrar.Repo,
  username: "postgres",
  password: "postgres",
  database: "registrar_dev",
  hostname: "postgres",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
# config :faithful_word_api, FaithfulWordApi.Endpoint,
#   # url: [host: "api.faithfulword.app"],
#   check_origin: ["//localhost", "//api.faithfulword.app"],
#   secret_key_base: "QI+125cFBB5Z+vR6D3ULCuhDalvbkd7Gse5zkpLrjhSK7sdm8XeNeB/Gq1zO5Gt8",
#   render_errors: [view: FaithfulWordApi.ErrorView, accepts: ~w(html json)],
#   pubsub: [name: FaithfulWordApi.PubSub, adapter: Phoenix.PubSub.PG2]

use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :metademo_mnesia, MetademoMnesiaWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
# config :metademo_mnesia, MetademoMnesia.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "postgres",
#   password: "postgres",
#   database: "metademo_mnesia_test",
#   hostname: "localhost",
#   pool: Ecto.Adapters.SQL.Sandbox

config :metademo_mnesia, MetademoMnesia.Repo,
  adapter: EctoMnesia.Adapter

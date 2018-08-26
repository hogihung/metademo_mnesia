# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :metademo_mnesia,
  ecto_repos: [MetademoMnesia.Repo]

# Configure Mnesia fo Ecto
config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORGE_TYPE", :disc_copies}

config :mnesia,
  dir: 'priv/data/mnesia'

# Configures the endpoint
config :metademo_mnesia, MetademoMnesiaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bBiHl/DBblnuRw00ZIE42IfRhWomUmu9hJLqHxMBS2ZWfm/Yt53GtKO6e0++OANx",
  render_errors: [view: MetademoMnesiaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MetademoMnesia.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

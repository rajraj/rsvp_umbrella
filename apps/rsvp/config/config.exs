use Mix.Config

config :rsvp, ecto_repos: [Rsvp.Repo]

import_config "#{Mix.env}.exs"

config :rsvp, Rsvp.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "rsvp_development",
  username: "postgres",
  password: "postgres"

config :rsvp, ecto_repos: [Rsvp.Repo]

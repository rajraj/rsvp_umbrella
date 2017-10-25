use Mix.Config

# Configure your database
config :rsvp, Rsvp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "rsvp_dev",
  hostname: "localhost",
  pool_size: 10

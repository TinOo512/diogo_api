use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :diogo_api, DiogoApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :diogo_api, DiogoApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "diogo_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure comeonin number of rounds to avoid slowing tests
config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1
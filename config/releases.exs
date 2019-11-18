import Config

db_user = System.get_env("DB_USER", "postgres")
db_password = System.get_env("DB_PASSWORD", "postgres")
db_host = System.get_env("DB_HOST", "localhost")
db_name = System.get_env("DB_NAME", "fmzn_prod")

IO.inspect(db_host)
IO.inspect(db_user)


config :fmzn, FmznWeb.Endpoint,
  secret_key_base: "LkrIIPvPC9XgMqkhgH1RsOn+CyJ+Th/dVRKSxxjE86A+oeEPIal9Gr4DXOffUKjR"

# Configure your database
config :fmzn, Fmzn.Repo,
  username: db_user,
  password: db_password,
  database: db_name,
  hostname: db_host,
  pool_size: 15

defmodule Fmzn.Repo do
  use Ecto.Repo,
    otp_app: :fmzn,
    adapter: Ecto.Adapters.Postgres
end

defmodule Registrar.Repo do
  use Ecto.Repo,
    otp_app: :registrar,
    adapter: Ecto.Adapters.Postgres
end

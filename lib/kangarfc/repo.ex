defmodule Kangarfc.Repo do
  use Ecto.Repo,
    otp_app: :kangarfc,
    adapter: Ecto.Adapters.Postgres
end

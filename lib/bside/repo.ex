defmodule Bside.Repo do
  use Ecto.Repo,
    otp_app: :bside,
    adapter: Ecto.Adapters.Postgres
end

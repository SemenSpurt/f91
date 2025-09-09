defmodule F91.Repo do
  use Ecto.Repo,
    otp_app: :f91,
    adapter: Ecto.Adapters.Postgres
end

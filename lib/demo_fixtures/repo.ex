defmodule DemoFixtures.Repo do
  use Ecto.Repo,
    otp_app: :demo_fixtures,
    adapter: Ecto.Adapters.Postgres
end

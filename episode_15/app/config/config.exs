use Mix.Config

config :app, Trains.Repo,
  database: "app_repo",
  hostname: "localhost"

config :app, ecto_repos: [Trains.Repo]

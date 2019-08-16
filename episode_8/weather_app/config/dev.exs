use Mix.Config

config :weather_app, WeatherAppWeb.Endpoint,
  url: [host: "localhost"],
  http: [port: 4000]
  # render_errors: [
  #   view: WeatherAppWeb.ErrorView, accepts: ~w(html json)
  # ]

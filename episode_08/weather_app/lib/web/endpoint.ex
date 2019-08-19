defmodule WeatherAppWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :weather_app

  plug(WeatherAppWeb.Router)
end

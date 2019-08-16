defmodule WeatherAppWeb.HomeController do
  use Phoenix.Controller, namespace: WeatherAppWeb

  def index(conn, _params) do
    [data] = WeatherApp.get_weather(["Los Angeles"])
    Phoenix.Controller.html(conn, """
      The weather in #{data.city} is #{data.temp} degrees celsius.
    """)
  end
end

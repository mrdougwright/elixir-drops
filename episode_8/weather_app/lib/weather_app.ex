defmodule WeatherApp do
  def get_weather(cities) do
    Metex.Coordinator.retrieve_temps(cities)
  end
end

defmodule WeatherApp.Application do
  use Application

  def start(:normal, []) do
    Supervisor.start_link(
      [WeatherAppWeb.Endpoint],
      strategy: :one_for_one
    )
  end
end

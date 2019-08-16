defmodule Weather do
  def fetch(city) do
    [city]
    |> Metex.Coordinator.retrieve_temps()
    |> List.first
  end
end

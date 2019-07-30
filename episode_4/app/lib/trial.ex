defmodule Trial do
  def start(%{name: name}) do
    {:ok, "Trial started for #{name}"}
  end
end

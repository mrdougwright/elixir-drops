defmodule Cache do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    :ets.new(:cache, [:public, :named_table, read_concurrency: true])
    {:ok, :ready}
  end

  def insert(tuple), do: :ets.insert(:cache, tuple)
  def lookup(key), do: :ets.lookup(:cache, key)
  def delete(key), do: :ets.delete(:cache, key)
end

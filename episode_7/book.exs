defmodule Book do

  def start do
    Agent.start(fn -> %{} end, name: __MODULE__)
  end

  def get(author) do
    Agent.get(__MODULE__, fn state -> state[author] end)
  end

  def put(author, books) do
    Agent.update(__MODULE__, fn state ->
      Map.put(state, author, books)
    end)
  end
end

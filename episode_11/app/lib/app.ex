defmodule App do
  use GenServer
  @name Queue

  # Client
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def new, do: App.start_link()
  def push(item), do: GenServer.call(@name, {:push, item})
  def pop, do: GenServer.call(@name, :pop)

  # Server
  def init(:ok), do: {:ok, []}

  def handle_call({:push, item}, _from, state) do
    new_state = state ++ [item]
    {:reply, new_state, new_state}
  end

  def handle_call(:pop, _from, [item | state]) do
    {:reply, item, state}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end
end

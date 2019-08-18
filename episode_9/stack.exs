defmodule Stack do
  use GenServer

  # Client
  def start_link do
    GenServer.start_link(Stack, %{})
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)
  def init(state) do
    {:ok, state}
  end

  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end

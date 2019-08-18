defmodule Resque do
  use GenServer
  @name MyResque

  # Client
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def add_worker(func) do
    GenServer.cast(@name, {:push, func})
  end

  def do_work do
    GenServer.call(@name, :pop)
  end

  # Server (callbacks)
  def init(:ok) do
    IO.puts("Doing some work")
    pop_a_job()
    {:ok, []}
  end

  def handle_cast({:push, func}, state) do
    {:noreply, state ++ [func]}
  end

  def handle_call(:pop, _from, [func | state]) do
    {:reply, func.(), state}
  end

  def handle_info(:pop_a_job, [func | state]) do
    func.()
    pop_a_job()
    {:noreply, state}
  end

  def handle_info(:pop_a_job, []) do
    pop_a_job()
    {:noreply, []}
  end

  defp pop_a_job do
    Process.send_after(self(), :pop_a_job, 5000)
  end
end

defmodule Ticker do
  use GenServer
  # versus using pid
  @name MyTicker

  # Client
  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: @name)
  end

  def portfolio, do: GenServer.call(@name, :portfolio)
  def price(sym), do: GenServer.call(@name, {:price, sym})
  def buy(sym, qty), do: GenServer.cast(@name, {:buy, sym, qty})
  def sell(sym, qty), do: GenServer.cast(@name, {:sell, sym, qty})

  # Server (callbacks)
  def init(:ok) do
    prices = Stock.API.latest_prices()
    get_stock_prices()
    {:ok, %{prices: prices, stocks: %{}}}
  end

  def handle_call(:portfolio, _from, %{stocks: stocks} = state) do
    {:reply, stocks, state}
  end

  def handle_call({:price, sym}, _from, %{prices: prices} = state) do
    {:reply, prices[sym], state}
  end

  def handle_cast({:buy, sym, qty}, %{stocks: stocks} = state) do
    stocks = Stock.API.buy(stocks, sym, qty)
    {:noreply, Map.put(state, :stocks, stocks)}
  end

  def handle_cast({:sell, sym, qty}, %{stocks: stocks} = state) do
    stocks = Stock.API.sell(stocks, sym, qty)
    {:noreply, Map.put(state, :stocks, stocks)}
  end

  def handle_info(:latest_prices, state) do
    prices = Stock.API.latest_prices()
    get_stock_prices()
    {:noreply, Map.put(state, :prices, prices)}
  end

  defp get_stock_prices() do
    IO.puts("Fetching stock prices...")
    Process.send_after(self(), :latest_prices, 30000)
  end
end

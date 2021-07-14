defmodule Stock.API do
  def price(symbol) do
    stocks[symbol] |> Enum.random()
  end

  def stocks do
    %{
      aapl: [195, 199, 220, 190],
      nflx: [300, 301, 308, 298],
      tsla: [225, 200, 240, 235]
    }
  end

  def latest_prices do
    stocks
    |> Enum.reduce(%{}, fn {sym, _}, acc ->
      Map.put(acc, sym, price(sym))
    end)
  end

  def buy(stocks, sym, qty) do
    case stocks[sym] do
      nil -> Map.put(stocks, sym, qty)
      val -> Map.put(stocks, sym, val + qty)
    end
  end

  def sell(stocks, sym, qty) do
    case stocks[sym] do
      nil -> stocks
      val -> Map.put(stocks, sym, val - qty)
    end
  end
end

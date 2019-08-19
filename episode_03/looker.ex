defmodule Looker do
  def search([item | _rest], item) do
    IO.puts("Item found!")
    item
  end

  def search([_ | rest], item) do
    search(rest, item)
  end

  def search([], _item) do
    IO.puts("No match found!")
  end
end

defmodule Looker_ do

  def search(items, item) do
    case Enum.find(items, & &1 == item) do
      nil -> IO.puts("No match found. 😭")
      val ->
        IO.puts("Item found!")
        val
    end
  end

end

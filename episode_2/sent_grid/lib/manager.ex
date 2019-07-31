defmodule Manager do
  def send_email(type) do
    case SentGrid.send_email(type) do
      {:ok, msg} -> IO.puts("Success! #{msg}")
      {:error, err} -> IO.puts("Error! #{err}")
    end
  end
end

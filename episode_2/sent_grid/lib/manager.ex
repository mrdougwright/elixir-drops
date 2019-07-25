defmodule Manager do

  def send_email(type) do
    case SentGrid.send_email(type) do
      {:ok, msg} -> "Success! #{msg}"
      {:error, err} -> "Error! #{err}"
    end
  end
end

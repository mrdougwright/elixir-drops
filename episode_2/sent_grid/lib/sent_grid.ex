defmodule SentGrid do
  @moduledoc """
  Documentation for SentGrid.
  """

  @doc """
  `send_email` takes one argument type (`atom`) and
  returns an ok/error tuple result.

  Examples
      iex> SentGrid.send_email(:support)
      {:ok, "Support email sent."}
      iex> SentGrid.send_email(:spam)
      {:error, "Invalid email type."}
  """
  def send_email(:marketing) do
    {:ok, "Marketing email sent."}
  end
  def send_email(:support), do: {:ok, "Support email sent."}
  def send_email(:other), do: {:ok, "Other email sent."}
  def send_email(_), do: {:error, "Invalid email type."}
end

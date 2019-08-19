defmodule SentGrid do
  def send_email(email) do
    {:ok, "Email sent to: #{email}"}
    # {:error, "Invalid email."}
  end
end

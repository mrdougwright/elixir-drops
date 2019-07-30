defmodule User do
  def create(params) do
    {:ok, user} = Ekto.save_user(params)
    user
  end

  def send_email(%{email: email} = user) do
    {:ok, msg} = SentGrid.send_email(email)
    IO.puts msg
    user
  end

  def start_trial(user) do
    {:ok, msg} = Trial.start(user)
    IO.puts msg
    user
  end
end

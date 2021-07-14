defmodule Manager do
  def setup_user(params) do
    params
    |> User.create()
    |> User.send_email()
    |> User.start_trial()
  end

  def setup_user(params) do
    with {:ok, %{email: email} = user} <- Ekto.save_user(params),
         {:ok, msg1} <- SentGrid.send_email(email),
         {:ok, msg2} <- Trial.start(user) do
      IO.puts(msg1)
      IO.puts(msg2)
      user
    end
  end
end

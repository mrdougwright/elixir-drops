# Rock, Paper, Scissors
# players are letters, i.e. "RPSPRS"
# answer -> P, S, R

defmodule RPS do
  @winners %{"R" => "S", "S" => "P", "P" => "R"}

  def find_winners(players) do
    chars = String.split(players, "", trim: true)

    get_winners(chars)
  end

  def get_winners([p1, p2 | rest]) do
    find_winner(p1, p2) ++ get_winners(rest)
  end

  def get_winners(other), do: other

  def find_winner(p1, p1), do: []

  def find_winner(p1, p2) do
    case @winners[p1] == p2 do
      true -> [p1]
      false -> [p2]
    end
  end
end

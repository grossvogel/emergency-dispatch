defmodule EmergencyDispatch.GameProcessor do
  alias EmergencyDispatch.Game

  def update(%Game{time_elapsed: time} = game) do
    %{game | time_elapsed: time + 1}
  end
end

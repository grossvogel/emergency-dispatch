defmodule EmergencyDispatch.Game do
  alias EmergencyDispatch.{Locations}

  defstruct time_elapsed: 0,
            work_crews: [],
            active_events: [],
            score: 50,
            win_condition: 100,
            lose_condition: 0,
            locations: []

  def generate_new() do
    # do random things to generate a base game
    %EmergencyDispatch.Game{
      locations: Locations.random_locations(4)
    }
  end
end

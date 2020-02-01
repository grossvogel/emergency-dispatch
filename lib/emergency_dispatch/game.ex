defmodule EmergencyDispatch.Game do
  alias EmergencyDispatch.{Locations}

  defstruct time_elapsed: 0,
            work_crews: 3,
            active_events: [],
            score: 50,
            win_condition: 60,
            lose_condition: 40,
            locations: [],
            flash_messages: []

  def generate_new() do
    # do random things to generate a base game
    %EmergencyDispatch.Game{
      locations: Locations.random_locations(16)
    }
  end
end

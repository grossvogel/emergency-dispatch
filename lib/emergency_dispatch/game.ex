defmodule EmergencyDispatch.Game do
  alias EmergencyDispatch.{Level, Locations}

  defstruct time_elapsed: 0,
            work_crews: 3,
            score: 50,
            locations: [],
            flash_messages: [],
            level: %Level{}

  def generate_new() do
    # do random things to generate a base game
    level = Level.first_level()

    %EmergencyDispatch.Game{
      locations: Locations.random_locations(16),
      level: level,
      work_crews: level.total_crews
    }
  end
end

defmodule EmergencyDispatch.EventGenerator do
  alias EmergencyDispatch.{Game, Event, Location}

  def generate(%Game{time_elapsed: time, locations: locations} = game) do
    if rem(time, 5) == 0 do
      # todo: make random
      event = %Event{}

      case 0..(length(game.locations) - 1)
           |> Enum.filter(fn index -> is_nil(Enum.at(locations, index).current_event) end)
           |> Enum.take_random(1) do
        # found a random cell to add the event to
        [location_index] ->
          updated_location = Map.put(Enum.at(locations, location_index), :current_event, event)
          Map.put(game, :locations, List.replace_at(locations, location_index, updated_location))

        # all cells have an event already
        [] ->
          game
      end
    else
      game
    end
  end
end

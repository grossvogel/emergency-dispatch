defmodule EmergencyDispatch.Events do
  alias EmergencyDispatch.{Game, Locations}

  def assign_crew_check(%{work_crews: 0} = game, _loc_id) do
    game
  end

  def assign_crew_check(%{work_crews: work_crews, locations: locations} = game, loc_id) do
    loc_index = Enum.find_index(game.locations, fn x -> x.id == String.to_integer(loc_id) end)
    loc_selected = Enum.fetch!(locations, loc_index)

    case loc_selected.current_event do
      # no event
      nil ->
        game

      # event is already fully crewed
      %{crew_number_assigned: 3} ->
        game

      # we can add a crew to this event
      event ->
        updated_event = %{event | crew_number_assigned: event.crew_number_assigned + 1}
        updated_location = Map.put(Enum.at(locations, loc_index), :current_event, updated_event)

        game
        |> Map.put(:locations, List.replace_at(locations, loc_index, updated_location))
        |> Map.put(:work_crews, work_crews - 1)
    end
  end

  def remove_all(%Game{locations: locations} = game) do
    updated_locations = Enum.map(locations, fn loc -> %{loc | current_event: nil} end)
    %{game | locations: updated_locations}
  end
end

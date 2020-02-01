defmodule EmergencyDispatch.EventProcessor do
  alias EmergencyDispatch.Location

  def process(game) do
    updated_locations =
      game.locations
      |> Enum.map(&process_location_event/1)

    %{game | locations: updated_locations}
  end

  def process_location_event(%Location{current_event: nil} = location) do
    location
  end

  def process_location_event(%Location{current_event: event} = location) do
    %{location | current_event: %{event | time_elapsed: event.time_elapsed + 1}}
  end
end

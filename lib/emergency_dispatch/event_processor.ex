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
    updated_event =
    event
    |> increment_time_elapsed()
    |> apply_work_units()
    %{location | current_event: updated_event}
  end


  defp apply_work_units(%{work_units_remaining: unit_rem, crew_number_assigned: crew_num} = event) do
    Map.put(event, :work_units_remaining, unit_rem - crew_num)
  end

  defp increment_time_elapsed(%{time_elapsed: time_elapsed} = event) do
    Map.put(event, :time_elapsed, time_elapsed + 1)
  end
end

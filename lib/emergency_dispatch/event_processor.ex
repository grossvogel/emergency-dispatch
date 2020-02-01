defmodule EmergencyDispatch.EventProcessor do
  alias EmergencyDispatch.{Event, Game, Location}

  @score_multiplier 2

  def process(%Game{locations: locations} = game) do
    {updated_locations, updated_game} =
      Enum.map_reduce(locations, game, &process_location_event/2)

    %{updated_game | locations: updated_locations}
  end

  def process_location_event(%Location{current_event: nil} = location, game) do
    {location, game}
  end

  def process_location_event(%Location{current_event: event} = location, game) do
    {updated_event, updated_game} =
      event
      |> increment_time_elapsed()
      |> apply_work_units()
      |> check_conditions(game, location)

    updated_location = %{location | current_event: updated_event}
    {updated_location, updated_game}
  end

  defp apply_work_units(%{work_units_remaining: unit_rem, crew_number_assigned: crew_num} = event) do
    Map.put(event, :work_units_remaining, unit_rem - crew_num)
  end

  defp increment_time_elapsed(%{time_elapsed: time_elapsed} = event) do
    Map.put(event, :time_elapsed, time_elapsed + 1)
  end

  # success
  defp check_conditions(%Event{work_units_remaining: remaining} = event, game, location)
       when remaining <= 0 do
    updated_game =
      game
      |> Map.put(:score, game.score + event.severity * @score_multiplier)
      |> Map.put(:work_crews, game.work_crews + event.crew_number_assigned)
      |> Map.put(:flash_messages, [location.success_text | game.flash_messages])

    IO.inspect("success")
    IO.inspect(game, label: "game")
    IO.inspect(updated_game, label: "updated_game")

    {nil, updated_game}
  end

  # failure
  defp check_conditions(%Event{time_elapsed: elapsed, time_limit: limit} = event, game, location)
       when elapsed > limit do
    updated_game =
      game
      |> Map.put(:score, game.score - event.severity * @score_multiplier)
      |> Map.put(:work_crews, game.work_crews + event.crew_number_assigned)
      |> Map.put(:flash_messages, [location.failure_text | game.flash_messages])

    {nil, updated_game}
  end

  defp check_conditions(event, game, _location), do: {event, game}
end

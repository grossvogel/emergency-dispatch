defmodule EmergencyDispatch.EventGenerator do
  alias EmergencyDispatch.{Game, Event, Location, Message}
  @event_gen_period 5
  @event_gen_likelihood 100
  @work_unit_multiplier 10
  @severities [1, 2, 3]
  @time_limits [5, 10, 15]

  def generate(%Game{time_elapsed: time} = game)
      when rem(time, @event_gen_period) == 0 do
    if should_generate() do
      attach_random_event(game)
    else
      game
    end
  end

  def generate(game) do
    game
  end

  defp should_generate() do
    :rand.uniform(100) <= @event_gen_likelihood
  end

  defp attach_random_event(%Game{locations: locations} = game) do
    case 0..(length(locations) - 1)
         |> Enum.filter(fn index -> is_nil(Enum.at(locations, index).current_event) end)
         |> Enum.take_random(1) do
      # found a random cell to add the event to
      [location_index] ->
        updated_location =
          Map.put(Enum.at(locations, location_index), :current_event, random_event())

        message = %Message{type: "Problem Reported", text: updated_location.problem_text}

        game
        |> Map.put(:locations, List.replace_at(locations, location_index, updated_location))
        |> Map.put(:flash_messages, [message | game.flash_messages])

      # all cells have an event already
      [] ->
        game
    end
  end

  defp random_event() do
    # TODO: tweak these to make them doable but challenging
    [severity] = Enum.take_random(@severities, 1)
    [time_limit] = Enum.take_random(@time_limits, 1)
    work_units = severity * @work_unit_multiplier

    %Event{
      severity: severity,
      time_limit: time_limit,
      work_units_remaining: work_units,
      total_work_units: work_units
    }
  end
end

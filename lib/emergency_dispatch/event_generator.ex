defmodule EmergencyDispatch.EventGenerator do
  alias EmergencyDispatch.{Game, Event, Message}

  # avg severity is 2, 12 events per minute = so we generate 7 * 24 = 168 work units per minute
  # 3 workers can contribute 180 work units per minute

  def generate(%Game{time_elapsed: time, level: %{event_gen_period: period}} = game)
      when rem(time, period) == 0 do
    if should_generate(game) do
      attach_random_event(game)
    else
      game
    end
  end

  def generate(game) do
    game
  end

  defp should_generate(%Game{level: %{event_gen_likelihood: likelihood}}) do
    :rand.uniform(100) <= likelihood
  end

  defp attach_random_event(%Game{locations: locations} = game) do
    case 0..(length(locations) - 1)
         |> Enum.filter(fn index -> is_nil(Enum.at(locations, index).current_event) end)
         |> Enum.take_random(1) do
      # found a random cell to add the event to
      [location_index] ->
        updated_location =
          Map.put(Enum.at(locations, location_index), :current_event, random_event(game))

        message = %Message{
          type: "Problem Reported at " <> updated_location.name,
          text: updated_location.problem_text
        }

        game
        |> Map.put(:locations, List.replace_at(locations, location_index, updated_location))
        |> Map.put(:flash_messages, [message | game.flash_messages])

      # all cells have an event already
      [] ->
        game
    end
  end

  defp random_event(%Game{
         level: %{
           work_unit_multiplier: multiplier,
           severities: severities,
           time_limits: time_limits
         }
       }) do
    [severity] = Enum.take_random(severities, 1)
    [time_limit] = Enum.take_random(time_limits, 1)
    work_units = severity * multiplier

    %Event{
      severity: severity,
      time_limit: time_limit,
      work_units_remaining: work_units,
      total_work_units: work_units
    }
  end
end

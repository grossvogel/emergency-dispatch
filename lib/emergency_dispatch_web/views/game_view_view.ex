defmodule EmergencyDispatchWeb.GameViewView do
  use EmergencyDispatchWeb, :view
  import EmergencyDispatch.Level, only: [is_last_level?: 1]
  alias EmergencyDispatch.Game

  def term_text(%Game{level: %{level_number: 1}}), do: "First Term"
  def term_text(%Game{level: %{level_number: 2}}), do: "Second Term"
  def term_text(%Game{level: %{level_number: 3}}), do: "Third Term"
  def term_text(%Game{level: %{level_number: 4}}), do: "Fourth Term"

  def to_class(string) do
    string
    |> String.downcase()
    |> String.first()
  end

  def work_progress(%{current_event: event}) do
    units_complete = event.total_work_units - event.work_units_remaining
    div(units_complete * 100, event.total_work_units)
  end

  def timeout_progress(%{current_event: event}) do
    time_remaining = event.time_limit - event.time_elapsed
    div(time_remaining * 100, event.time_limit)
  end

  def active_crew_class(%{work_crews: crews}, num) when crews >= num do
    "available"
  end

  def active_crew_class(_, _) do
    "unavailable"
  end

  def game_stats(game) do
    %{event_count: total, solved_events: solved, failed_events: failed} = calc_game_stats(game)

    ~E"""
    <div class="stats">
      <h4>Performance This Term</h4>
      <ul>
        <li>
          <span> <%= total %> Problems Encountered
        </li>
        <li>
          <span> <%= solved %> Problems Solved
        </li>
        <li>
          <span> <%= failed %> Failures
        </li>
      </ul>
    </div>
    """
  end

  defp calc_game_stats(%Game{flash_messages: messages}) do
    Enum.reduce(messages, empty_stats(), &stat_reducer/2)
  end

  defp empty_stats() do
    %{event_count: 0, solved_events: 0, failed_events: 0}
  end

  defp stat_reducer(message, stats) do
    IO.inspect(message)
    IO.inspect(stats)
    key = stat_key(message)
    Map.put(stats, key, stats[key] + 1)
  end

  defp stat_key(%{type: <<c::binary-size(1)>> <> _rest}) do
    case String.downcase(c) do
      "p" -> :event_count
      "b" -> :solved_events
      "d" -> :failed_events
      _ -> nil
    end
  end
end

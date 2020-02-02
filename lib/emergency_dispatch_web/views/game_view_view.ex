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
end

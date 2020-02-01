defmodule EmergencyDispatchWeb.GameViewView do
  use EmergencyDispatchWeb, :view

  def to_class(string) do
    string
    |> String.downcase()
    |> String.replace(" ", "-")
  end

  def work_progress(%{current_event: event}) do
    units_complete = event.total_work_units - event.work_units_remaining
    div(units_complete * 100, event.total_work_units)
  end

  def timeout_progress(%{current_event: event}) do
    time_remaining = event.time_limit - event.time_elapsed
    div(time_remaining * 100, event.time_limit)
  end
end

defmodule EmergencyDispatch.Event do
  # severity: 1. 2. 3
  # crew_number_assigned: 0, 1, 2, 3
  # time_limit: TBD
  defstruct severity: 1, time_limit: 60, time_elapsed: 0, crew_number_assigned: 0, work_units_remaining: 10
end

defmodule EmergencyDispatch.Event do
  # severity: 1. 2. 3
  # crew_number_assigned: 0, 1, 2, 3
  # time_limit: TBD
  defstruct severity: 1,
            time_limit: 10,
            time_elapsed: 0,
            crew_number_assigned: 0,
            total_work_units: 10,
            work_units_remaining: 10
end

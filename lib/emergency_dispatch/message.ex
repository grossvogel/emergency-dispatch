defmodule EmergencyDispatch.Message do
  # type is 'Problem Reported', 'Disaster Strikes', 'Breaking News'
  defstruct type: "",
            text: ""
end

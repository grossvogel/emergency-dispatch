defmodule EmergencyDispatch.Location do
  defstruct id: 0,
            name: "",
            problem_text: "",
            success_text: "",
            failure_text: "",
            image_sprite: "",
            current_event: nil,
            src: ""
end

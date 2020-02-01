defmodule EmergencyDispatch.Locations do
  alias EmergencyDispatch.Location

  @all_locations %{
    1 => %Location{
      id: 1,
      name: "School",
      problem_text: "Lead in the drinking fountains"
    },
    2 => %Location{
      id: 2,
      name: "Hospital",
      problem_text: "Staph infection outbreak"
    },
    3 => %Location{
      id: 3,
      name: "City Hall",
      problem_text: "Somebody stole your parking spot"
    },
    4 => %Location{
      id: 4,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose"
    }
  }

  def get_location(id) do
    @all_locations[id]
  end

  def random_locations(count) do
    @all_locations
    |> Enum.take_random(count)
    |> Enum.map(fn {key, loc} -> loc end)
  end
end

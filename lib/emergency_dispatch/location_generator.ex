defmodule EmergencyDispatch.Locations do
  alias EmergencyDispatch.Location

  @all_locations %{
    1 => %Location{
      id: 1,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text: "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text: "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    2 => %Location{
      id: 2,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text: "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text: "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    3 => %Location{
      id: 3,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text: "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text: "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    4 => %Location{
      id: 4,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text: "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text: "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
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

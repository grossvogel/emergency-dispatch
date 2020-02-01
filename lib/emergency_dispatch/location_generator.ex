defmodule EmergencyDispatch.Locations do
  alias EmergencyDispatch.Location

  @all_locations %{
    1 => %Location{
      id: 1,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    2 => %Location{
      id: 2,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text:
        "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text:
        "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    3 => %Location{
      id: 3,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text:
        "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    4 => %Location{
      id: 4,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text:
        "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text:
        "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
    },
    5 => %Location{
      id: 5,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    6 => %Location{
      id: 6,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text:
        "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text:
        "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    7 => %Location{
      id: 7,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text:
        "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    8 => %Location{
      id: 8,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text:
        "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text:
        "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
    },
    9 => %Location{
      id: 9,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    10 => %Location{
      id: 10,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text:
        "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text:
        "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    11 => %Location{
      id: 11,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text:
        "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    12 => %Location{
      id: 12,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text:
        "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text:
        "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
    },
    13 => %Location{
      id: 13,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    14 => %Location{
      id: 14,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text:
        "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text:
        "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    15 => %Location{
      id: 15,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text:
        "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    16 => %Location{
      id: 16,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text:
        "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text:
        "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
    },
    17 => %Location{
      id: 17,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    18 => %Location{
      id: 18,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text:
        "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text:
        "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    19 => %Location{
      id: 19,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text:
        "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    20 => %Location{
      id: 20,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text:
        "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text:
        "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
    },
    21 => %Location{
      id: 21,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
    },
    22 => %Location{
      id: 22,
      name: "Hospital",
      problem_text: "Staph infection outbreak",
      success_text:
        "News Alert! Public health officials have contained the staph pandemic! Grateful patients present Mayor with a medal!",
      failure_text:
        "Breaking News! Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients."
    },
    23 => %Location{
      id: 23,
      name: "City Hall",
      problem_text: "Cyberattack on DMV",
      success_text:
        "News Alert! Mayor employs nice hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "Breaking News! City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!"
    },
    24 => %Location{
      id: 24,
      name: "Doggie Park",
      problem_text: "Pit bull on the loose",
      success_text:
        "News Alert! Heroic dog whisperer saves the day! People give mayor credit for his quick thinking!",
      failure_text:
        "Breaking News! Rabbies outbreak in city as feral pit bull terrorizes residents. Mayor nowhere to be found!"
    },
    25 => %Location{
      id: 25,
      name: "School",
      problem_text: "Lead in the drinking fountains",
      success_text:
        "News Alert! Crisis averted - lead removed from drinking fountains! Mayor is a hero!",
      failure_text:
        "Breaking News! Children exposed to lead due to Mayorial incompetence. Parents march on city hall!"
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

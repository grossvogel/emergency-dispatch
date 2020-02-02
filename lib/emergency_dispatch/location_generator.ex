defmodule EmergencyDispatch.Locations do
  alias EmergencyDispatch.Location

  @all_locations %{
    1 => %Location{
      id: 1,
      name: "Brother Martin",
      problem_text: "Lead in the drinking fountains",
      success_text: "Lead extraction process implemented by city water experts! Mayor is a hero!",
      failure_text:
        "Children exposed to lead due to Mayorial incompetence. Parents march on city hall!",
      src: "/images/school.svg"
    },
    2 => %Location{
      id: 2,
      name: "Tulane Hospital",
      problem_text: "Water pipes broken. No handwashing possible.",
      success_text:
        "Hospital staff can be sanitary again. Grateful patients present Mayor with a medal!",
      failure_text:
        "Entire city put in quaruntine due to mutant staph epidemic! Mayor baricaded in city hall to avoid roving bands of zombie patients.",
      src: "/images/hospital.svg"
    },
    3 => %Location{
      id: 3,
      name: "City Hall",
      problem_text: "Cyberattack on NOLA DMV",
      success_text:
        "Mayor employs Red Hat hackers to thwart cyber attack! DMV is open for business!",
      failure_text:
        "City government shut down due to ransomware attack! Embarrasing mayorial emails leaked to the press!",
      src: "/images/capitol.svg"
    },
    4 => %Location{
      id: 4,
      name: "Louis Armstrong Airport",
      problem_text: "Luggage conveyor belts broken",
      success_text:
        "Conveyor belt turned off and then turned on again - that worked! People give mayor credit for his quick thinking!",
      failure_text: "No luggage makes it to its destination. Mayor in Auruba - optics are bad!",
      src: "/images/airport.svg"
    },
    5 => %Location{
      id: 5,
      name: "Army Barracks",
      problem_text: "PA system on the fritz!",
      success_text: "Announcements can be heard once again! Cadets are heard to say - yaaay.",
      failure_text:
        "With no ability to communicate to the entire base - everything falls into chaos!",
      src: "/images/army.svg"
    },
    6 => %Location{
      id: 6,
      name: "NBC Bank",
      problem_text: "ATM asking customers intrussive personal questions.",
      success_text:
        "Skynet AI discovered to have taken over and was shut down - Mayor declared to be next John Connor",
      failure_text:
        "All bank customers accounts have been hacked. 'No Comment' - Mayor's spokeswoman",
      src: "/images/bank.svg"
    },
    7 => %Location{
      id: 7,
      name: "St. Louis Cathedral",
      problem_text: "Power outage plunges parrishoners into darkness!",
      success_text: "Electiricty flowing again! Geaux Saints!",
      failure_text: "Masses said by candlelight. Mayor blamed!",
      src: "/images/church.svg"
    },
    8 => %Location{
      id: 8,
      name: "Hard Rock Construction Site",
      problem_text: "Rubble shifts and blocks side street",
      success_text: "Efficient city crews remove rubble and even clean street! City rejoices!",
      failure_text: "Grid lock in the french quarter - mulitple parade routes affected!",
      src: "/images/construction.svg"
    },
    9 => %Location{
      id: 9,
      name: "Folgers Coffee Factory",
      problem_text: "Coffee roaster burning beans",
      success_text: "Crisis averted - caffeine is flowing free once again!",
      failure_text: "Sleepy anxious poplulace demand answers as entire coffee crop ruined!",
      src: "/images/factory.svg"
    },
    10 => %Location{
      id: 10,
      name: "Bourbon Orleans Hotel",
      problem_text: "Bananas Foster tableside service on fire!",
      success_text:
        "Fire put out and desert was still pretty good! Mayor gets free 2 night stay!",
      failure_text: "With no bananas foster on the menu - hotel vacancies increase drastically!",
      src: "/images/hotel.svg"
    },
    11 => %Location{
      id: 11,
      name: "Central Lockup",
      problem_text: "Mugshots are coming out like glamour shots!",
      success_text: "No more confusing criminals for heart throbs!",
      failure_text: "Prison dating sites break the internet!",
      src: "/images/jail.svg"
    },
    12 => %Location{
      id: 12,
      name: "Police Station",
      problem_text: "Parking Ticket machine broken.",
      success_text:
        "NOPD can issue parking tickets again! I guess that is a good thing says citizens.",
      failure_text:
        "No parking tickets issued this month. Citizens may be happy but city is broke!",
      src: "/images/police-station.svg"
    },
    13 => %Location{
      id: 13,
      name: "Rouses Supermarket",
      problem_text: "Ice cream freezer broken",
      success_text: "Crisis averted - mint choclate chip ice cream is saved!",
      failure_text:
        "Despondant citizens picket in front of mayor's house - I scream U scream We all scream for ice cream!",
      src: "/images/supermarket.svg"
    },
    14 => %Location{
      id: 14,
      name: "New Orleans Municipal Court",
      problem_text: "Gavel no longer works!",
      success_text:
        "Quick thinking worker grabs a toy gavel that adds a little levity to dreary traffic court proceedings!",
      failure_text: "With no ability to make calls to order - a riot breaks out. Mayor blamed!!!",
      src: "/images/courthouse.svg"
    },
    15 => %Location{
      id: 15,
      name: "Fleurty Girl",
      problem_text: "T-shirt printing machine has gone haywire!",
      success_text: "Local business saved! Mayor and staff receive free classic T's!",
      failure_text:
        "Misprinted shirts offend tourists. Mayor blamed for dropping revenue numbers!",
      src: "/images/shop.svg"
    },
    16 => %Location{
      id: 16,
      name: "University of New Orleans",
      problem_text: "Sprinkler system activates at random moments!",
      success_text: "No more getting soaked going to class! Toga party thrown in Mayor's honor!",
      failure_text:
        "Wet students and professors organize a petition to call for early elections!",
      src: "/images/university.svg"
    }
  }

  def get_location(id) do
    @all_locations[id]
  end

  def random_locations(count) do
    @all_locations
    |> Enum.take_random(count)
    |> Enum.map(fn {_key, loc} -> loc end)
  end
end

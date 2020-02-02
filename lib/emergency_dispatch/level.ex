defmodule EmergencyDispatch.Level do
  defstruct level_number: 1,
            event_gen_period: 1,
            event_gen_likelihood: 50,
            work_unit_multiplier: 5,
            severities: [1, 2, 2, 3],
            time_limits: [6, 11, 16],
            total_crews: 3,
            win_condition: 60,
            lose_condition: 40

  @levels %{
    1 => %{
      level_number: 1,
      event_gen_period: 1,
      event_gen_likelihood: 40,
      work_unit_multiplier: 5,
      severities: [1, 2, 3],
      time_limits: [6, 11, 16],
      total_crews: 3,
      win_condition: 70,
      lose_condition: 25
    },
    2 => %{
      level_number: 2,
      event_gen_period: 1,
      event_gen_likelihood: 50,
      work_unit_multiplier: 4,
      severities: [1, 1, 2, 2, 3],
      time_limits: [5, 10, 15],
      total_crews: 4,
      win_condition: 80,
      lose_condition: 30
    },
    3 => %{
      level_number: 3,
      event_gen_period: 1,
      event_gen_likelihood: 70,
      work_unit_multiplier: 4,
      severities: [1, 1, 1, 2, 2, 2, 3],
      time_limits: [5, 9, 13],
      total_crews: 5,
      win_condition: 85,
      lose_condition: 35
    },
    4 => %{
      level_number: 4,
      event_gen_period: 1,
      event_gen_likelihood: 95,
      work_unit_multiplier: 3,
      severities: [1, 1, 1, 1, 2, 2, 2, 3],
      time_limits: [4, 7, 10],
      total_crews: 5,
      win_condition: 95,
      lose_condition: 35
    }
  }

  def first_level() do
    @levels[1]
  end

  def next_level(%{level_number: num}) do
    @levels[num + 1]
  end

  def is_last_level?(level) do
    level.level_number >= Map.size(@levels)
  end
end

defmodule EmergencyDispatchWeb.GameView do
  use Phoenix.LiveView
  alias EmergencyDispatchWeb.Router.Helpers, as: Routes
  alias EmergencyDispatch.{Game, GameProcessor, Level, EventGenerator, EventProcessor, Events}

  @timer_interval 1000

  def render(assigns) do
    EmergencyDispatchWeb.GameViewView.render("game_view.html", assigns)
  end

  def mount(_session, socket) do
    if connected?(socket), do: Process.send_after(self(), :tick, @timer_interval)
    {:ok, assign(socket, %{game: Game.generate_new()})}
  end

  def handle_event("crew", params, %{assigns: assigns} = socket) do
    game = Events.assign_crew_check(assigns.game, params["loc_id"])

    {:noreply, assign(socket, %{game: game})}
  end

  def handle_event("next_level", _params, %{assigns: %{game: game}} = socket) do
    next_level = Level.next_level(game.level)

    game_updates = %{
      flash_messages: [],
      level: next_level,
      score: 50,
      work_crews: next_level.total_crews
    }

    updated_game =
      game
      |> Map.merge(game_updates)
      |> Events.remove_all()

    trigger_next_tick(updated_game)

    {:noreply, assign(socket, %{game: updated_game})}
  end

  def handle_info(:tick, %{assigns: %{game: game}} = socket) do
    trigger_next_tick(game)

    updated_game =
      game
      |> GameProcessor.update()
      |> EventProcessor.process()
      |> EventGenerator.generate()

    {:noreply, assign(socket, game: updated_game)}
  end

  defp trigger_next_tick(%Game{score: score, level: %{win_condition: win, lose_condition: lose}})
       when score >= win or score <= lose do
    # don't trigger anymore ticks, game is over
  end

  defp trigger_next_tick(_game) do
    Process.send_after(self(), :tick, @timer_interval)
  end
end

defmodule EmergencyDispatchWeb.GameView do
  use Phoenix.LiveView
  alias EmergencyDispatchWeb.Router.Helpers, as: Routes
  alias EmergencyDispatch.{Game, GameProcessor, EventGenerator, EventProcessor}

  @timer_interval 1000

  def render(assigns) do
    EmergencyDispatchWeb.GameViewView.render("game_view.html", assigns)
  end

  def mount(session, socket) do
    if connected?(socket), do: Process.send_after(self(), :tick, @timer_interval)
    Game.generate_new()
    {:ok, assign(socket, %{game: Game.generate_new()})}
  end

  def handle_info(:tick, %{assigns: %{game: game}} = socket) do
    Process.send_after(self(), :tick, @timer_interval)
    IO.inspect(game)

    updated_game =
      game
      |> GameProcessor.update()
      |> EventProcessor.process()
      |> EventGenerator.generate()

    {:noreply, assign(socket, game: updated_game)}
  end
end

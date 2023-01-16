defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []) do
    Agent.start_link(fn -> %{plots: %{}, autoid: 1} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> Map.values(state.plots) end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn state ->
      plot = create_plot(state.autoid, register_to)

      state =
        state
        |> put_in([:plots, state.autoid], plot)
        |> Map.put(:autoid, state.autoid + 1)

      {plot, state}
    end)
  end

  def release(pid, plot_id) do
    Agent.update(pid, &%{&1 | plots: Map.delete(&1.plots, plot_id)})
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, &Map.get(&1.plots, plot_id, {:not_found, "plot is unregistered"}))
  end

  defp create_plot(id, name), do: %Plot{plot_id: id, registered_to: name}
end

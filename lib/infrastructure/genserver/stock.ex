defmodule Infrastructure.Genserver.Stock do
  require Logger
  alias Infrastructure.Genserver.State
  @behaviour GenServer

  def start(name, price_provider) do
    GenServer.start_link(
      __MODULE__,
      {name, price_provider},
      name: String.to_atom(name)
    )
  end

  @spec state(atom()) :: State.t()
  def state(name), do: GenServer.call(name, :state)

  @impl GenServer
  def init({name, price_provider}) do
    {:ok, State.new(name, price_provider), {:continue, :initialize}}
  end

  @impl GenServer
  def handle_continue(:initialize, state) do
    update()
    {:noreply, State.update(state)}
  end

  @impl GenServer
  def handle_call(:state, _, state) do
    {:reply, state, state}
  end

  @impl GenServer
  def handle_info(:update, state) do
    update()
    {:noreply, State.update(state)}
  end

  def update, do: Process.send_after(self(), :update, 2_000)
end

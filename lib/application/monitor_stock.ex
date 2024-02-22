defmodule Application.MonitorStock do
  alias Domain.Name
  @monitor Application.compile_env(:stocks, :monitor)

  @spec run(String.t()) :: :error | :ok
  def run(rname) do
    case Name.new(rname) do
      {:ok, name} -> @monitor.run(name)
      _ -> :error
    end
  end
end

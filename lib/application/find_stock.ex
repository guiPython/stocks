defmodule Application.FindStock do
  alias Domain.{Stock, Name}
  @monitor Application.compile_env(:stocks, :monitor)

  @spec run(String.t()) :: Stock.t() | nil
  def run(rname) do
    case Name.new(rname) do
      {:ok, name} -> @monitor.find(name)
      _ -> nil
    end
  end
end

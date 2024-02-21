defmodule Domain.Price do
  @type t :: float()

  @spec new(float()) :: {:ok, Price.t()} | {:error, String.t()}
  def new(value) when value >= 0.0 do
    {:ok, value}
  end
  def new(_), do: {:error, "invalid price"}
end

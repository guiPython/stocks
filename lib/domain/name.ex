defmodule Domain.Name do
  @type t :: String.t()

  @spec new(String.t()) :: {:ok, Name.t()} | {:error, String.t()}
  def new(value) do
    length = String.length(value)
    cond do
      length < 5 or length > 6 -> {:error, "invalid name"}
      true -> {:ok, value}
    end
  end
end

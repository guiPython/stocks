defmodule Domain.Repository do
  alias Domain.{Stock, Name}

  @callback save(Stock.t()) :: :ok | :error
  @callback find(Name.t()) :: Stock.t()
end

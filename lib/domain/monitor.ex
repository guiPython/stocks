defmodule Domain.Monitor do
  alias Domain.{Stock, Name}

  @callback run(Name.t()) :: :ok | :error
  @callback find(Name.t()) :: Stock.t() | nil
end

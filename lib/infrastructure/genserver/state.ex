defmodule Infrastructure.Genserver.State do
  alias Domain.{Stock, Name}

  @type status :: :initialized | :uninitialized | :notupdated
  @type price_provider :: (Name.t() -> float())
  @type t :: %__MODULE__{
          stock: Stock.t(),
          status: status(),
          price_of: price_provider(),
          updated_at: DateTime.t()
        }

  @enforce_keys [:stock, :price_of, :updated_at]
  defstruct [:stock, :price_of, :updated_at, status: :uninitialized]

  @spec new(Name.t(), price_provider()) :: State.t()
  def new(name, price_provider) do
    {:ok, stock} = Stock.new(name, 0.0)

    %__MODULE__{
      stock: stock,
      price_of: price_provider,
      updated_at: DateTime.utc_now()
    }
  end

  @spec update(State.t()) :: State.t()
  def update(%__MODULE__{} = state) do
    stock = state.stock
    price = state.price_of.(stock.name)

    case Stock.change_price(stock, price) do
      {:ok, stock} ->
        %__MODULE__{
          price_of: state.price_of,
          stock: stock,
          status: :initialized,
          updated_at: DateTime.utc_now()
        }

      _ ->
        %__MODULE__{state | status: :notupdated}
    end
  end
end

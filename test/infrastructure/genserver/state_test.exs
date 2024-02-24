defmodule Infrastructure.Genserver.StateTest do
  use ExUnit.Case
  alias Domain.Stock
  alias Infrastructure.Genserver.State

  test "create a new state" do
    name = "PETR4"

    state = State.new(name, fn _ -> 42.0 end)
    {:ok, stock} = Stock.new(name, 0.0)

    assert state.status == :uninitialized
    assert state.stock == stock
  end

  test "update a state with invalid price" do
    name = "PETR4"
    {:ok, stock} = Stock.new(name, 0.0)

    state =
      State.new(name, fn _ -> -1 end)
      |> State.update()

    assert state.status == :notupdated
    assert state.stock == stock
  end

  test "update a state with valid price" do
    name = "PETR4"
    price = 42.0
    {:ok, stock} = Stock.new(name, price)

    state =
      State.new(name, fn _ -> price end)
      |> State.update()

    assert state.status == :initialized
    assert state.stock == stock
  end
end

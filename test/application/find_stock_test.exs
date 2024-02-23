defmodule Application.FindStockTest do
  use ExUnit.Case
  import Mox
  alias Stocks.Monitor
  alias Application.FindStock
  alias Domain.Stock

  setup :verify_on_exit!

  test "returns nil when pass a valid name and no monitoring stock" do
    Monitor.Mock |> expect(:find, 1, fn _ -> nil end)
    name = "PETR4"
    assert FindStock.run(name) == nil
  end

  test "returns stock when pass a valid name and monitoring stock" do
    name = "PETR4"
    {:ok, stock} = Stock.new(name, 10.0)
    Monitor.Mock |> expect(:find, 1, fn _ -> stock end)
    assert FindStock.run(name) == stock
  end

  test "return nil when pass invalid name" do
    Monitor.Mock |> expect(:find, 0, fn _ -> nil end)
    name = "PETR"
    assert FindStock.run(name) == nil
  end
end

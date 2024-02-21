defmodule Domain.StockTest do
  use ExUnit.Case
  alias Domain.Stock

  test "create a new stock" do
    assert Stock.new("PETR4", 10.0) == {
             :ok,
             %Stock{name: "PETR4", price: 10.0}
           }
  end

  test "create a new stock with invalid name" do
    assert Stock.new("PETR", 10.0) == {
             :error,
             "invalid name"
           }
  end

  test "create a new stock with invalid price" do
    assert Stock.new("PETR4", -10.0) == {
             :error,
             "invalid price"
           }
  end

  test "must change price with valid value" do
    {:ok, stock} = Stock.new("PETR4", 10.0)

    assert Stock.change_price(stock, 13.0) == {
             :ok,
             %Stock{name: "PETR4", price: 13.0}
           }
  end

  test "cannot change price with invalid value" do
    stock = Stock.new("PETR4", 10.0)

    assert Stock.change_price(stock, -13.0) == {
             :error,
             "invalid price"
           }
  end
end

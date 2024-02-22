defmodule Application.MonitorStockTest do
  use ExUnit.Case
  alias Application.MonitorStock
  alias Stocks.Monitor
  import Mox

  setup :verify_on_exit!

  test "dont monitor when pass invalid name" do
    Monitor.Mock |> expect(:run, 0, fn _ -> :error end)
    name = "PETR"
    assert MonitorStock.run(name) == :error
  end

  test "monitor when pass valid name" do
    Monitor.Mock |> expect(:run, 1, fn _ -> :ok end)
    name = "PETR4"
    assert MonitorStock.run(name) == :ok
  end

  test "error on monitor when pass valid name" do
    Monitor.Mock |> expect(:run, 1, fn _ -> :error end)
    name = "PETR4"
    assert MonitorStock.run(name) == :error
  end
end

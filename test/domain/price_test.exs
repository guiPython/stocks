defmodule Domain.PriceTest do
  use ExUnit.Case
  alias Domain.Price

  test "create a valid price" do
    assert Price.new(10.0) == {:ok, 10.0}
  end

  test "create an invalid price" do
    assert Price.new(-10.0) == {:error, "invalid price"}
  end
end

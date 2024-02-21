defmodule Domain.NameTest do
  use ExUnit.Case, async: true
  alias Domain.Name

  test "create a new valid name" do
    name = "PETR4"
    assert Name.new(name) == {:ok, name}
  end

  test "create an invalid name with 4 char`s" do
    name = "PETR"
    assert Name.new(name) == {:error, "invalid name"}
  end

  test "create an invalid name with 7 char`s" do
    name = "PETR343"
    assert Name.new(name) == {:error, "invalid name"}
  end
end

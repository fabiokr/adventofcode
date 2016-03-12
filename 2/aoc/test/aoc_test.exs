defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  test "calculates wrap correctly" do
    assert Aoc.calculate("2x3x4") == 58
    assert Aoc.calculate("1x1x10") == 43
  end

  test "input" do
    assert Aoc.input("../input.txt") == 1606483
  end
end

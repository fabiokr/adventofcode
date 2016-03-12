defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  test "(" do
    assert Aoc.floor("(") == 1
  end

  test ")" do
    assert Aoc.floor(")") == -1
  end

  test "complex" do
    assert Aoc.floor("((((()(()") == 5
  end

  test "input" do
    assert Aoc.input("../input.txt") == 74
  end
end

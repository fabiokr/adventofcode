defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  test "count" do
    assert Aoc.count(">") == 2
    assert Aoc.count("v") == 2
    assert Aoc.count("<") == 2
    assert Aoc.count("^") == 2
    assert Aoc.count("^>v<") == 4
    assert Aoc.count("^v^v^v^v^v") == 2
  end

  test "input" do
    assert Aoc.input("../input.txt") == 2565
  end
end

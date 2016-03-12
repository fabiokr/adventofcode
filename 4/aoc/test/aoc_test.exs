defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  test "mine" do
    assert Aoc.mine("abcdef") == 609043
    assert Aoc.mine("pqrstuv") == 1048970
  end

  test "input" do
    assert Aoc.input("../input.txt") == 254575
  end
end

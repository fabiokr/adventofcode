defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  test "nice?" do
    assert Aoc.nice?("ugknbfddgicrmopn")
    assert Aoc.nice?("aaa")
    refute Aoc.nice?("jchzalrnumimnmhp")
    refute Aoc.nice?("haegwjzuvuyypxyu")
    refute Aoc.nice?("dvszwmarrgswjxmb")
  end

  test "input" do
    assert Aoc.input("../input.txt") == 255
  end
end

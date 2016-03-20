defmodule AocTest do
  use ExUnit.Case
  doctest Aoc

  test "assign" do
    assert Aoc.wire(%{}, "123 -> x") == %{"x" => 123}
    assert Aoc.wire(%{}, "123 -> xx") == %{"xx" => 123}
    assert Aoc.wire(%{"y" => 123}, "y -> x") == %{"y" => 123, "x" => 123}
  end

  test "AND" do
    assert Aoc.wire(%{"x" => 123, "y" => 456}, "x AND y -> z") == %{"x" => 123, "y" => 456, "z" => 72}
    assert Aoc.wire(%{"y" => 456}, "1 AND y -> z") == %{"y" => 456, "z" => 0}
    assert Aoc.wire(%{"xx" => 123, "y" => 456}, "xx AND y -> zz") == %{"xx" => 123, "y" => 456, "zz" => 72}
  end

  test "OR" do
    assert Aoc.wire(%{"x" => 123, "y" => 456}, "x OR y -> z") == %{"x" => 123, "y" => 456, "z" => 507}
    assert Aoc.wire(%{"xx" => 123, "y" => 456}, "xx OR y -> zz") == %{"xx" => 123, "y" => 456, "zz" => 507}
  end

  test "LSHIFT" do
    assert Aoc.wire(%{"x" => 123}, "x LSHIFT 2 -> z") == %{"x" => 123, "z" => 492}
    assert Aoc.wire(%{"xx" => 123}, "xx LSHIFT 2 -> zz") == %{"xx" => 123, "zz" => 492}
  end

  test "RSHIFT" do
    assert Aoc.wire(%{"y" => 456}, "y RSHIFT 2 -> z") == %{"y" => 456, "z" => 114}
    assert Aoc.wire(%{"yy" => 456}, "yy RSHIFT 2 -> zz") == %{"yy" => 456, "zz" => 114}
  end

  test "NOT" do
    assert Aoc.wire(%{"x" => 123}, "NOT x -> z") == %{"x" => 123, "z" => 65412}
    assert Aoc.wire(%{"xx" => 123}, "NOT xx -> zz") == %{"xx" => 123, "zz" => 65412}
  end

  test "input" do
    assert Aoc.input("../input.txt") == 16076
  end
end

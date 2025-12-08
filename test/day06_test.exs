defmodule AoC.Day06Test do
  use ExUnit.Case

  @example_input """
  123 328  51 64
   45 64  387 23
    6 98  215 314
  *   +   *   +
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day06.part1(@example_input) == 4_277_556
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day06.txt")
      result = AoC.Day06.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day06.part2(@example_input) == 3_263_827
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day06.txt")
      result = AoC.Day06.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end

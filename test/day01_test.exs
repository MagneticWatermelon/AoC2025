defmodule AoC.Day01Test do
  use ExUnit.Case

  @example_input """
  L68
  L30
  R48
  L5
  R60
  L55
  L1
  L99
  R14
  L82
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day01.part1(@example_input) == 3
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day01.txt")
      result = AoC.Day01.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day01.part2(@example_input) == 6
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day01.txt")
      result = AoC.Day01.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end

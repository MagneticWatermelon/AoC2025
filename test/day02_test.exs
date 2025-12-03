defmodule AoC.Day02Test do
  use ExUnit.Case

  @example_input """
  11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day02.part1(@example_input) == 1_227_775_554
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day02.txt")
      result = AoC.Day02.part1(input)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day02.part2(@example_input) == 4_174_379_265
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day02.txt")
      result = AoC.Day02.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end

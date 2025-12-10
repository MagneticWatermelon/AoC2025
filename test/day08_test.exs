defmodule AoC.Day08Test do
  use ExUnit.Case

  @example_input """
  162,817,812
  57,618,57
  906,360,560
  592,479,940
  352,342,300
  466,668,158
  542,29,236
  431,825,988
  739,650,466
  52,470,668
  216,146,977
  819,987,18
  117,168,530
  805,96,715
  346,949,466
  970,615,88
  941,993,340
  862,61,35
  984,92,344
  425,690,689
  """

  describe "part1/1" do
    test "solves example" do
      assert AoC.Day08.part1(@example_input) == 40
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day08.txt")
      result = AoC.Day08.part1(input, 1000)
      IO.puts("\nPart 1 answer: #{result}")
      assert result != nil
    end
  end

  describe "part2/1" do
    test "solves example" do
      assert AoC.Day08.part2(@example_input) == 25272
    end

    test "solves puzzle" do
      input = File.read!("priv/inputs/day08.txt")
      result = AoC.Day08.part2(input)
      IO.puts("\nPart 2 answer: #{result}")
      assert result != nil
    end
  end
end

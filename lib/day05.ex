defmodule AoC.Day05 do
  @moduledoc """
  Advent of Code 2025 - Day 5
  """

  def part1(input) do
    {ranges, numbers} =
      input
      |> parse()

    Enum.reduce(numbers, 0, fn number, acc ->
      if Enum.any?(ranges, fn {s, e} -> number >= s and number <= e end), do: acc + 1, else: acc
    end)
  end

  def part2(input) do
    {ranges, _} =
      input
      |> parse()

    Enum.reduce(ranges, 0, fn {s, e}, acc ->
      acc + (e - s + 1)
    end)
  end

  defp parse(input) do
    ranges =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.filter(&String.contains?(&1, "-"))
      |> Enum.map(&parse_range/1)
      |> Enum.sort()
      |> Enum.reduce([], fn {s, e}, acc ->
        found = Enum.find(acc, fn {s2, e2} -> does_overlap?({s, e}, {s2, e2}) end)

        if found do
          {s2, e2} = found
          acc = List.delete(acc, {s2, e2})
          [{min(s, s2), max(e, e2)} | acc]
        else
          [{s, e} | acc]
        end
      end)
      |> Enum.sort()

    numbers =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.reject(&String.contains?(&1, "-"))
      |> Enum.reject(&(String.length(&1) == 0))
      |> Enum.map(&String.to_integer/1)

    {ranges, numbers}
  end

  def does_overlap?({s1, e1}, {s2, e2}) do
    s1 <= e2 and e1 >= s2
  end

  defp parse_range(range) do
    String.split(range, "-", parts: 2)
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end
end

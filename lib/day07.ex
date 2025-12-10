defmodule AoC.Day07 do
  @moduledoc """
  Advent of Code 2025 - Day 7
  """

  def part1(input) do
    lines = parse(input)
    start = List.first(lines) |> find_start()
    row_length = lines |> List.first() |> length()

    lines
    |> Enum.map(&find_splitters/1)
    |> Enum.reduce({[start], 0}, &split(&1, &2, row_length))
    |> elem(1)
  end

  def part2(input) do
    lines = parse(input)
    start = List.first(lines) |> find_start()
    row_length = lines |> List.first() |> length()

    lines
    |> Enum.map(&find_splitters/1)
    |> Enum.reduce(%{start => 1}, &simulate_timelines(&1, &2, row_length))
    |> Map.values()
    |> Enum.sum()
  end

  defp parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
  end

  defp find_start(row) do
    Enum.find_index(row, fn char -> char == "S" end)
  end

  defp find_splitters(row) do
    Enum.with_index(row, fn char, index -> {char, index} end)
    |> Enum.filter(fn {char, _} -> char == "^" end)
    |> Enum.map(fn {_, index} -> index end)
  end

  defp split(splitters, {beams, count}, row_length)
       when is_list(splitters) and is_list(beams) and is_integer(row_length) do
    Enum.reduce(splitters, {beams, count}, fn splitter, {acc, total_count} ->
      if Enum.member?(acc, splitter) do
        {beam_split(acc, splitter, row_length) ++ List.delete(acc, splitter), total_count + 1}
      else
        {acc, total_count}
      end
    end)
  end

  defp beam_split(beams, splitter, row_length)
       when is_list(beams) and is_integer(splitter) and is_integer(row_length) do
    left = max(splitter - 1, 0)
    right = min(splitter + 1, row_length - 1)

    [left, right] |> Enum.reject(fn pos -> Enum.member?(beams, pos) end)
  end

  defp simulate_timelines(splitters, timelines_map, row_length) do
    Enum.reduce(timelines_map, %{}, fn {position, count}, acc ->
      if Enum.member?(splitters, position) do
        left = max(position - 1, 0)
        right = min(position + 1, row_length - 1)

        acc
        |> Map.update(left, count, &(&1 + count))
        |> Map.update(right, count, &(&1 + count))
      else
        Map.update(acc, position, count, &(&1 + count))
      end
    end)
  end
end

defmodule AoC.Day04 do
  @moduledoc """
  Advent of Code 2025 - Day 4
  """

  def part1(input) do
    map = parse(input)

    map
    |> Enum.filter(fn {_pos, cell} -> cell == "@" end)
    |> Enum.map(fn {{row, col}, _} -> get_score(row, col, map) end)
    |> Enum.sum()
  end

  def part2(input) do
    map = parse(input)

    remove_loop(map, 0)
  end

  defp parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&String.graphemes/1)
    |> Enum.with_index()
    |> Enum.flat_map(fn {row, row_idx} ->
      row
      |> Enum.with_index()
      |> Enum.map(fn {cell, col_idx} -> {{row_idx, col_idx}, cell} end)
    end)
    |> Map.new()
  end

  defp get_adjacent_count(row, col, map) do
    neighbors =
      for r <- (row - 1)..(row + 1),
          c <- (col - 1)..(col + 1),
          {r, c} != {row, col},
          do: {r, c}

    Enum.count(neighbors, fn pos -> Map.get(map, pos) == "@" end)
  end

  defp get_score(row, col, map) do
    if get_adjacent_count(row, col, map) > 3, do: 0, else: 1
  end

  defp should_remove?(row, col, map) do
    get_adjacent_count(row, col, map) < 4
  end

  defp remove_loop(map, total_removed) do
    to_remove =
      map
      |> Enum.filter(fn {{row, col}, cell} ->
        cell == "@" and should_remove?(row, col, map)
      end)
      |> Enum.map(fn {{row, col}, _} -> {row, col} end)

    case to_remove do
      [] ->
        total_removed

      positions ->
        new_map =
          Enum.reduce(positions, map, fn {row, col}, acc -> Map.put(acc, {row, col}, ".") end)

        remove_loop(new_map, total_removed + length(positions))
    end
  end
end

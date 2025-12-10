defmodule AoC.Day08 do
  @moduledoc """
  Advent of Code 2025 - Day 8
  """

  def part1(input, limit \\ 10) do
    points = parse(input)

    pairs =
      for {a, i} <- Enum.with_index(points),
          {b, j} <- Enum.with_index(points),
          i < j,
          do: {a, b}

    pairs
    |> Enum.map(fn {a, b} -> {a, b, calc_distance(a, b)} end)
    |> Enum.sort(fn {_, _, d1}, {_, _, d2} -> d1 < d2 end)
    |> Enum.reduce({%{}, 0}, fn {c1, c2, _}, {connection_map, count} ->
      if count < limit do
        if not same_cluster?(connection_map, c1, c2) do
          connection_map
          |> Map.update(c1, [c2], fn existing -> [c2 | existing] end)
          |> Map.update(c2, [c1], fn existing -> [c1 | existing] end)
          |> (fn connection_map -> {connection_map, count + 1} end).()
        else
          {connection_map, count + 1}
        end
      else
        {connection_map, count}
      end
    end)
    |> elem(0)
    |> find_clusters(points)
    |> Enum.map(&MapSet.size/1)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  @spec part2(any()) :: any()
  def part2(input) do
    points = parse(input)

    pairs =
      for {a, i} <- Enum.with_index(points),
          {b, j} <- Enum.with_index(points),
          i < j,
          do: {a, b}

    pairs
    |> Enum.map(fn {a, b} -> {a, b, calc_distance(a, b)} end)
    |> Enum.sort(fn {_, _, d1}, {_, _, d2} -> d1 < d2 end)
    |> Enum.reduce({%{}, {nil, nil}}, fn {c1, c2, _}, {connection_map, found_pair} ->
      cond do
        found_pair != {nil, nil} ->
          {connection_map, found_pair}

        same_cluster?(connection_map, c1, c2) ->
          {connection_map, {nil, nil}}

        true ->
          new_connection_map =
            connection_map
            |> Map.update(c1, [c2], fn existing -> [c2 | existing] end)
            |> Map.update(c2, [c1], fn existing -> [c1 | existing] end)

          if length(find_clusters(new_connection_map, points)) == 1 do
            {new_connection_map, {c1, c2}}
          else
            {new_connection_map, {nil, nil}}
          end
      end
    end)
    |> elem(1)
    |> (fn {{x1, _, _}, {x2, _, _}} -> x1 * x2 end).()
  end

  defp parse(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn line ->
      line
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
  end

  defp calc_distance({x1, y1, z1}, {x2, y2, z2}) do
    :math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2 + (z2 - z1) ** 2)
  end

  defp find_clusters(connection_map, all_points) do
    {clusters, _visited} =
      Enum.reduce(all_points, {[], MapSet.new()}, fn point, {clusters, visited} ->
        if MapSet.member?(visited, point) do
          {clusters, visited}
        else
          cluster = traverse(point, connection_map, MapSet.new())
          {[cluster | clusters], MapSet.union(visited, cluster)}
        end
      end)

    clusters
  end

  defp traverse(point, connection_map, visited) do
    if MapSet.member?(visited, point) do
      visited
    else
      visited = MapSet.put(visited, point)
      neighbors = Map.get(connection_map, point, [])

      Enum.reduce(neighbors, visited, fn neighbor, acc ->
        traverse(neighbor, connection_map, acc)
      end)
    end
  end

  defp same_cluster?(connection_map, c1, c2) do
    reachable = traverse(c1, connection_map, MapSet.new())
    MapSet.member?(reachable, c2)
  end
end

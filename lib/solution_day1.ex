defmodule SolutionDay1 do
  require Integer

  def solve do
    {:ok, content} = FileReader.parse_input("data/input_day1.txt")

    [first_list, second_list] =
      content
      |> String.split("\n", trim: true)
      |> Enum.flat_map(fn s ->
        s
        |> String.split("   ", trim: true)
        |> Enum.map(fn s -> Integer.parse(s) end)
      end)
      |> Enum.with_index()
      |> Enum.split_with(fn {_k, v} -> Integer.is_even(v) end)
      |> Tuple.to_list()
      |> Enum.map(fn list ->
        list
        |> Enum.map(fn {{value, _s}, _index} -> value end)
        |> Enum.sort()
      end)

    total_distance =
      [first_list, second_list]
      |> Enum.zip_reduce(0, fn [first, second], acc ->
        acc + abs(first - second)
      end)

    total_similarity =
      first_list
      |> Enum.map(fn item ->
        count =
          second_list
          |> Enum.filter(fn x -> x == item end)
          |> Enum.count()

        count * item
      end)
      |> Enum.sum()

    IO.puts(total_distance)
    IO.puts(total_similarity)
  end
end

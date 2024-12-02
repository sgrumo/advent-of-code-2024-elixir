defmodule SolutionDay2 do
  require Integer

  defp is_increasing_or_decreasing_only(list) do
    Enum.sort(list) == list || Enum.reverse(Enum.sort(list)) == list
  end

  defp check_increment(_current, []) do
    true
  end

  defp check_increment(current, [next | rest]) do
    diff = abs(current - next)

    if(diff >= 1 && diff <= 3) do
      check_increment(next, rest)
    else
      false
    end
  end

  def is_gradually_incrementing([head | tail]) do
    check_increment(head, tail)
  end

  defp parse_reports(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(fn report ->
      report
      |> String.split(" ", trim: true)
      |> Enum.map(fn x -> String.to_integer(x) end)
    end)
  end

  defp is_report_safe_part_1(list) do
    is_increasing_or_decreasing_only(list) and is_gradually_incrementing(list)
  end

  defp is_report_safe_part_2(list) do
    is_report_safe_part_1(list) or
      list
      |> Enum.with_index()
      |> Enum.any?(fn {_element, index} -> is_report_safe_part_1(List.delete_at(list, index)) end)
  end

  def solve do
    {:ok, content} = FileReader.parse_input("data/input_day2.txt")

    part_1_safe_report =
      content
      |> parse_reports()
      |> Enum.filter(&is_report_safe_part_1/1)
      |> Enum.count()

    part_2_safe_report =
      content
      |> parse_reports()
      |> Enum.filter(&is_report_safe_part_2/1)
      |> Enum.count()

    IO.puts(part_1_safe_report)
    IO.puts(part_2_safe_report)
  end
end

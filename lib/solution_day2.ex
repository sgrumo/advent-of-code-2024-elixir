defmodule SolutionDay2 do
  require Integer

  defp is_increasing_or_decreasing_only(list) do
    Enum.sort(list) == list || Enum.reverse(Enum.sort(list)) == list
  end

  defp check_next(_current, []) do
    true
  end

  defp check_next(current, [next | rest]) do
    diff = abs(current - next)

    if(diff >= 1 && diff <= 3) do
      check_next(next, rest)
    else
      false
    end
  end

  def is_gradually_incrementing([head | tail]) do
    check_next(head, tail)
  end

  def solve do
    {:ok, content} = File.read("data/input_day2.txt")

    safe_report =
      content
      |> String.split("\n", trim: true)
      |> Enum.map(fn report ->
        report
        |> String.split(" ", trim: true)
        |> Enum.map(fn x -> String.to_integer(x) end)
      end)
      |> Enum.filter(&is_increasing_or_decreasing_only/1)
      |> Enum.filter(&is_gradually_incrementing/1)
      |> Enum.count()

    IO.inspect(safe_report)
  end
end

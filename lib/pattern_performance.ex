defmodule PatternPerformance do
  defstruct slowest_time: 0,
            total_time: 0,
            words_tried: 0

  def words do
    File.read!(Path.join([__DIR__, "../words.txt"]))
      |> String.split("\n")
  end

  def record_access(module) do
    # "Warming" up the system
    module.is_word?("apple")
    Enum.reduce(words, %PatternPerformance{}, fn word, performance ->
      time =
        case :timer.tc(module, :is_word?, [word]) do
          {t, true} -> t
          {t, false} ->
            IO.puts "Word '#{word}' not found!"
            t
        end
      %{performance |
        slowest_time: max(time, performance.slowest_time),
        words_tried: performance.words_tried + 1,
        total_time: performance.total_time + time
      }
    end)
  end
end

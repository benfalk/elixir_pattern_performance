defmodule PatternPerformance.GBTree do
  @external_resource words_file = Path.join([__DIR__, "../words.txt"])
  @words File.stream!(words_file, [], :line)
          |> Enum.map(&String.strip(&1))
          |> Enum.reduce(:gb_trees.empty, fn word, acc ->
            :gb_trees.enter(word, true, acc)
          end)
          |> :gb_trees.balance
  def is_word?(word), do: :gb_trees.is_defined(word, @words)
end

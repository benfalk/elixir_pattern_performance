defmodule PatternPerformance.GBSet do
  @external_resource words_file = Path.join([__DIR__, "../words.txt"])
  @words File.stream!(words_file, [], :line)
          |> Enum.map(&String.strip(&1))
          |> Enum.reduce(:gb_sets.new, fn word, acc ->
            :gb_sets.insert(word, acc)
          end)
          |> :gb_sets.balance
  def is_word?(word), do: :gb_sets.is_member(word, @words)
end

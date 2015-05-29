defmodule PatternPerformance.HashDict do
  @external_resource words_file = Path.join([__DIR__, "../words.txt"])
  @words File.stream!(words_file, [], :line)
          |> Enum.map(&String.strip(&1))
          |> Enum.reduce(HashDict.new, fn word, acc ->
            HashDict.put(acc, word, true)
          end)
  def is_word?(word), do: HashDict.get(@words, word, false)
end

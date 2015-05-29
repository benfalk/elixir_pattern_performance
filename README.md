PatternPerformance
==================

This is looking into the "performance" difference between creating many
functions that can pattern match for an answer versus looking up against a
statically generated constant at compile time.

The general idea is this, given the following:

```elixir

defmodule PatternPerformance.Matching do
  def is_word?("apple"), do: true
  def is_word?("addict"), do: true
  # .... about 90k more words
  def is_word?(_any), do: false
end

```

```elixir

defmodule PatternPerformance.HashDict do
  @words ninety_thousand_words
         |> Enum.reduce(HashDict.new, fn word, acc ->
           HashDict.put(acc, word, true)
         end)
  def is_word?(word), do: HashDict.get(@words, word, false)
end

```

defmodule PatternPerformance.Matching do
  @external_resource words_file = Path.join([__DIR__, "../words.txt"])
  for word <- File.stream!(words_file, [], :line) do
    word = String.strip(word)
    def is_word?(unquote(word)), do: true
  end
  def is_word?(_word), do: false
end

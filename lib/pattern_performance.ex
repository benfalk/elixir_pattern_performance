defmodule PatternPerformance do
  def words do
    File.read!(Path.join([__DIR__, "../words.txt"]))
      |> String.split("\n")
  end

  def record_access(module) do
    # "Warming" up the system
    module.is_word?("apple")
  end
end

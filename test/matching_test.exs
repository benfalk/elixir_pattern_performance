defmodule MatchingTest do
  use ExUnit.Case

  test "that 'apple' is a word" do
    assert PatternPerformance.Matching.is_word?("apple")
  end

  test "that 'snickerdoodle' is not a word" do
    assert PatternPerformance.Matching.is_word?("snickerdoodle") == false
  end
end

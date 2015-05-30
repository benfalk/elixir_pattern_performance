defmodule PatternPerformanceTest do
  use ExUnit.Case
  
  test "that words is a list" do
    assert [_h|_] = PatternPerformance.words
  end
end

defmodule AlTest do
  use ExUnit.Case
  doctest Al

  test "greets the world" do
    assert Al.hello() == :world
  end
end

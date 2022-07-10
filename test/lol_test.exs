defmodule LolTest do
  use ExUnit.Case
  doctest Lol

  test "greets the world" do
    assert Lol.hello() == :world
  end
end

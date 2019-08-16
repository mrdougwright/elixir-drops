defmodule WeatherAppTest do
  use ExUnit.Case
  doctest WeatherApp

  test "greets the world" do
    assert WeatherApp.hello() == :world
  end
end

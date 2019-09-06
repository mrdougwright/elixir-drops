defmodule AppTest do
  use ExUnit.Case
  doctest App

  setup do
    {:ok, pid} = App.new()
    %{pid: pid}
  end

  test "new/0 creates a new queue", %{pid: pid} do
    assert Process.info(pid, :registered_name) == {:registered_name, Queue}
  end

  test "push/1 adds items to tail of queue" do
    assert App.push("item") == ["item"]
    assert App.push("another") == ["item", "another"]
  end

  describe "pop/0" do
    test "removes items from head of queue" do
      App.push("item1")
      App.push("item2")
      assert App.pop() == "item1"
      assert App.pop() == "item2"
    end

    test "on empty queue is noop" do
      assert App.pop() == nil
    end
  end
end

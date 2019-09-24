# iex --sname node1@localhost
# iex --sname node2@localhost

alias :mnesia, as: Mnesia

Mnesia.create_schema([:node1@localhost, :node2@localhost])

Mnesia.create_table(Person, attributes: [:id, :name])

Mnesia.dirty_write({Person, 1, "Doug"})

Mnesia.dirty_read({Person, 1})

data = fn ->
  Mnesia.write({Person, 2, "Jane"})
end

Mnesia.transaction(data)

# List.first
# just as fast as hd(), more readable
List.first(["a", :b, 42])
"a"

# Map.get
Map.get(%{a: "ayeee"}, :a)
"ayeee"

Map.get(%{a: "ayeee"}, :b)
nil

Map.get(%{a: "ayeee"}, :b, "beee")
"beee"


# Map.put
Map.put(%{a: "ayeee"}, :b, "beee")
%{a: "ayeee", b: "beee"}

map = %{a: "a"}
Map.put(map, :b, "b")
map


# Enum.find
Enum.find([2,4,6], 1)
#err
Enum.find([2,4,6], fn(num) -> num == 1 end)
nil
Enum.find([2,4,6], 1, fn(num) -> num == 1 end)
1
Enum.find([2,4,6], fn(num) -> num == 2 end)
2
Enum.find([2,4,6], & &1 == 2)
2


# Enum.reduce
Enum.reduce([1,2,3], fn(num, acc) -> num * acc end)
Enum.reduce([1,2,3], & &1 * &2)
6

Enum.reduce([2,4,6], fn(num, acc) -> (num/2) + acc end)
7.0
# 4/2 + 2 = 4
# 6/2 + 4 = 7

Enum.reduce([2,4,6], 2, fn(num, acc) -> (num/2) + acc end)
8.0
# 2/2 + 2 = 3.0
# 4/2 + 3 = 5.0
# 6/2 + 5 = 8.0

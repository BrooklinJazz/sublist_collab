defmodule SublistTest do
  use ExUnit.Case
  doctest Sublist

  @tag :basic
  test "test: is [1, 2, 3] a sublist of [1, 2, 3, 4, 5]" do
    assert Sublist.sublist([1, 2, 3], [1, 2, 3, 4, 5]) == :sublist
  end

  test "test: is [2, 3, 4] a sublist of [1, 2, 3, 4, 5]" do
    assert Sublist.sublist([2, 3, 4], [1, 2, 3, 4, 5]) == :sublist
  end

  test "test: is [3, 4, 5] a sublist of [1, 2, 3, 4, 5]" do
    assert Sublist.sublist([3, 4, 5], [1, 2, 3, 4, 5]) == :sublist
  end

  test "test: [4,3,2] a sublist of [1,2,3,4,5]" do
    assert Sublist.sublist([4, 3, 2], [1, 2, 3, 4, 5]) == :unequal
  end

  test "test: [1, 1, 2] a sublist of [1, 1, 1, 1, 2]" do
    assert Sublist.sublist([1, 1, 2], [1, 1, 1, 1, 2]) == :sublist
  end

  test "test: random_sublist of random_list" do
    # Generate a random list
    # grab a sublist of random size from that list

    random_list = Enum.map(1..1000, fn _ -> Enum.random(0..9) end)
    start = Enum.random(1..1000)
    finish = Enum.random(start..1000)
    random_sublist = Enum.slice(random_list, start..finish)
    assert Sublist.sublist(random_sublist, random_list) == :sublist
  end

  test "test: random_non_sublist of random_list" do
    # Generate a random list
    # grab a sublist of random size from that list

    random_list = Enum.map(1..1000, fn _ -> Enum.random(0..9) end)
    start = Enum.random(1..1000)
    finish = Enum.random(start..1000)
    random_sublist = ["a" | Enum.slice(random_list, start..finish)]
    assert Sublist.sublist(random_sublist, random_list) == :unequal
  end

  test "test: is [] a sublist of []" do
    assert Sublist.sublist([], []) == :sublist
  end

  test "test: is [1, 1] a sublist of [1]" do
    assert Sublist.sublist([1, 1], [1]) == :unequal
  end

  @tag :benchmark
  test "benchmark" do
    random_list = Enum.map(1..1000, fn _ -> Enum.random(0..9) end)
    random_sublist = Enum.slice(random_list, 997..1000)

    Benchee.run(
      %{
        "original" => fn -> Sublist.sublist(random_sublist, random_list) end,
        "optimized" => fn -> Optimized.sublist(random_sublist, random_list) end
      },
      memory_time: 10
    )
  end
end

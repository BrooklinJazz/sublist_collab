defmodule Optimized do
  @moduledoc """
  Documentation for `Sublist`.
  """

  def sublist([], []), do: :sublist

  def sublist(_candidate, []) do
    :unequal
  end

  def sublist(candidate, list_b) do
    sublist(candidate, list_b, length(list_b) - length(candidate))
  end

  # n ^ 2
  # m * n
  # [4, 3, 2] vs [1, 2, 3, 4, 5]
  # [4, 3, 2] vs [2, 3, 4, 5]
  # [4, 3, 2] vs [3, 4, 5]
  # [4, 3, 2] vs [4, 5]
  def sublist(_candidate, _list_b, 0) do
    :unequal
  end

  def sublist(candidate, list_b, count) do
    if starts_with?(list_b, candidate) do
      :sublist
    else
      list_b_tl = tl(list_b)
      sublist(candidate, list_b_tl, count - 1)
    end
  end

  def starts_with?(_list_b, []), do: true

  def starts_with?(list_b, list_a) do
    if hd(list_b) == hd(list_a) do
      starts_with?(tl(list_b), tl(list_a))
    else
      false
    end
  end
end

# optimized =
# for elem <- list_b, item <- list_a, elem == item do
#   item
# end
# |> Enum.any?(fn sub -> sub == list_a)
# case optimized do
#  true -> :optimized
#  false -> :unequal
# end
# =======================================================

# length = length(list_a)

# Enum.reduce(list_b, [], fn e, r ->
#  #
# end)

# Enum.take_while(list_b, )

defmodule Optimized do
  @moduledoc """
  Documentation for `Sublist`.
  """

  def sublist([], []), do: :sublist

  def sublist(_candidate, []) do
    :unequal
  end

  # n ^ 2
  # m * n
  # [4, 3, 2] vs [1, 2, 3, 4, 5]
  # [4, 3, 2] vs [2, 3, 4, 5]
  # [4, 3, 2] vs [3, 4, 5]
  # [4, 3, 2] vs [4, 5]
  def sublist(candidate, list_b) do
    if starts_with?(list_b, candidate) do
      :sublist
    else
      list_b_tl = tl(list_b)
      sublist(candidate, list_b_tl)
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

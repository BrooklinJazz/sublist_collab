defmodule Optimized do
  @moduledoc """
  Documentation for `Sublist`.
  """

  def sublist([], []), do: :sublist

  def sublist(candidate, list_b) do
    sublist(candidate, list_b, length(list_b) - length(candidate))
  end

  def sublist(_candidate, _, 0) do
    :unequal
  end

  # n ^ 2
  # m * n
  # [4, 3, 2] vs [1, 2, 3, 4, 5]
  # [4, 3, 2] vs [2, 3, 4, 5]
  # [4, 3, 2] vs [3, 4, 5]
  # [4, 3, 2] vs [4, 5]
  def sublist(candidate, list_b, remaining) do
    if starts_with?(list_b, candidate) do
      :sublist
    else
      sublist(candidate, tl(list_b), remaining - 1)
    end
  end

  def starts_with?(_list_b, []), do: true

  def starts_with?([same | list_b], [same | list_a]), do: starts_with?(list_b, list_a)

  def starts_with?(_, _), do: false
end

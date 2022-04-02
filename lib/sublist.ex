defmodule Sublist do
  @moduledoc """
  Documentation for `Sublist`.
  """

  def sublist([], []), do: :sublist

  def sublist(list_a, list_b)
      when length(list_b) < length(list_a) do
    :unequal
  end

  # n ^ 2
  # m * n
  # [4, 3, 2] vs [1, 2, 3, 4, 5]
  # [4, 3, 2] vs [2, 3, 4, 5]
  # [4, 3, 2] vs [3, 4, 5]
  # [4, 3, 2] vs [4, 5]
  def sublist(list_a, list_b) do
    if List.starts_with?(list_b, list_a) do
      :sublist
    else
      list_b_tl = tl(list_b)
      sublist(list_a, list_b_tl)
    end
  end
end

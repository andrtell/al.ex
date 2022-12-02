defmodule Al.BinaryTree do
  def empty() do
    nil
  end

  def is_empty?(t) do
    t == nil
  end

  def insert(h, key, val \\ nil)

  def insert(nil, key, val) do
    {key, val, nil, nil}
  end

  def insert({k, v, l_tree, r_tree}, key, val) do
    case key < k do
      true -> {k, v, insert(l_tree, key, val), r_tree}
      false -> {k, v, l_tree, insert(r_tree, key, val)}
    end
  end

  def member?(nil, _) do
    false
  end

  def member?({k, _, l_tree, r_tree}, key) do
    cond do
      key < k -> member?(l_tree, key)
      key > k -> member?(r_tree, key)
      true -> true
    end
  end
end

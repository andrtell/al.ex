defmodule Al.BinaryTree do
  def empty() do
    nil
  end

  def is_empty?(t) do
    t == nil
  end

  def insert(nil, k_new, v_new) do
    {k_new, v_new, nil, nil}
  end

  def insert({k, v, l_tree, r_tree}, k_new, v_new) do
    case k_new < k do
      true -> {k, v, insert(l_tree, k_new, v_new), r_tree}
      false -> {k, v, l_tree, insert(r_tree, k_new, v_new)}
    end
  end

  def member?(nil, _) do
    false
  end

  def member?({k, _, l_tree, r_tree}, k_new) do
    cond do
      k_new < k -> member?(l_tree, k_new)
      k_new > k -> member?(r_tree, k_new)
      true -> true
    end
  end
end

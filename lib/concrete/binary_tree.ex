defmodule Al.Concrete.BinaryTree do
  def empty() do
    nil
  end

  def is_empty?(t) do
    t == nil
  end

  def insert(t, val) do
    case t do
      nil ->
        {nil, val, nil}

      {l, v, r} ->
        case val < v do
          true -> {insert(l, val), v, r}
          false -> {l, v, insert(r, val)}
        end
    end
  end

  def member?(t, val) do
    case t do
      nil ->
        false

      {l, v, r} ->
        cond do
          val < v -> member?(l, val)
          val > v -> member?(r, val)
          true -> true
        end
    end
  end
end

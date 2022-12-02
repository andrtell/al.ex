defmodule Al.LeftishHeap do
  def empty() do
    nil
  end

  def is_empty?(h) do
    h == nil
  end

  def insert(h, val) do
    merge({1, val, nil, nil}, h)
  end

  def find_min(nil) do
    raise ArgumentError, "Heap is empty"
  end

  def find_min({_, val, _, _}) do
    val
  end

  def delete_min(nil) do
    raise ArgumentError, "Heap is empty"
  end

  def delete_min({_, _, a, b}) do
    merge(a, b)
  end

  def merge(nil, h), do: h
  def merge(h, nil), do: h

  def merge({_, val1, a1, b1} = h1, {_, val2, a2, b2} = h2) do
    if val1 > val2 do
      join(val1, a1, merge(b1, h2))
    else
      join(val2, a2, merge(b2, h1))
    end
  end

  defp join(x, a, b) do
    if rank(a) >= rank(b) do
      {rank(b) + 1, x, a, b}
    else
      {rank(a) + 1, x, b, a}
    end
  end

  def rank(nil) do
    0
  end

  def rank({r, _, _, _}) do
    r
  end
end

defmodule Al.LeftishHeap do
  def empty() do
    nil
  end

  def is_empty?(heap) do
    heap == nil
  end

  def find_max(nil) do
    raise ArgumentError, "Heap is empty"
  end

  def find_max({_, key, val, _, _}) do
    {key, val}
  end

  def insert(heap, key, val \\ nil) do
    merge({1, key, val, nil, nil}, heap)
  end

  def delete_max(nil) do
    raise ArgumentError, "Heap is empty"
  end

  def delete_max({_, _, _, l_heap, r_heap}) do
    merge(l_heap, r_heap)
  end

  def merge(nil, heap), do: heap
  def merge(heap, nil), do: heap

  def merge(
        {_, key_1, val_1, l_heap_1, r_heap_1} = heap_1,
        {_, key_2, val_2, l_heap_2, r_heap_2} = heap_2
      ) do
    if key_1 > key_2 do
      join(key_1, val_1, l_heap_1, merge(r_heap_1, heap_2))
    else
      join(key_2, val_2, l_heap_2, merge(r_heap_2, heap_1))
    end
  end

  defp join(key, val, a, b) do
    rank_a = rank(a)
    rank_b = rank(b)

    if rank_a > rank_b do
      {rank_b + 1, key, val, a, b}
    else
      {rank_a + 1, key, val, b, a}
    end
  end

  def rank(nil) do
    0
  end

  def rank({r, _, _, _, _}) do
    r
  end
end

defmodule Al.D.Que do
 
  def empty() do
    {[], []}
  end
  
  def is_empty?(q) do
    q == {[], []}
  end

  def enqueue({o, i}, val) do
    {o, [val | i]}
  end

  def dequeue({[], []}) do
    raise ArgumentError, "Queue is empty"
  end

  def dequeue({[val | o], i}) do
    {{o, i}, val}
  end

  def dequeue({[], i}) do
    dequeue({Enum.reverse(i), []})
  end
end

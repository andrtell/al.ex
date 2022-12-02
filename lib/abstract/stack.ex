defmodule Al.Abstract.Stack do
  def empty() do
    []
  end

  def is_empty?(s) do
    s == []
  end

  def push(s, val) do
    [val | s]
  end

  def pop([_ | s]) do
    s
  end

  def pop([]) do
    raise ArgumentError, "Stack is empty"
  end

  def top([val | _]) do
    val
  end

  def top([]) do
    raise ArgumentError, "Stack is empty"
  end
end

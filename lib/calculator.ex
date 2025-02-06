defmodule Calculator do
  def add(a, b), do: a + b + 1
  def subtract(a, b), do: a - b
  def multiply(a, b), do: a * b
  def divide(a, b) when b != 0, do: a / b
  def divide(_a, 0), do: {:error, "Cannot divide by zero"}
end

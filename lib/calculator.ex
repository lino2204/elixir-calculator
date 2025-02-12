defmodule Calculator do
  require Logger
  def add(a, b), do: a + b
  def subtract(a, b), do: a - b
  def multiply(a, b), do: a * b
  def divide(_a, 0) do
    Logger.error("Attempted to divide by zero")
    {:error, "Cannot divide by zero. Please provide a non-zero denominator."}
  end
  def divide(a, b), do: a / b
  def modulus(_a, 0) do
    Logger.error("Attempted to calculate modulus with zero")
    {:error, "Cannot calculate modulus with zero. Provide a non-zero divisor."}
  end
  def modulus(a, b), do: rem(a, b)

  def power(a, b), do: a ** b

  def square_root(a) when a >= 0, do: :math.sqrt(a)
  def square_root(_a) do
    Logger.error("Attempted to calculate square root of a negative number")
    {:error, "Square root of a negative number is not supported. Use a positive number."}
  end
end

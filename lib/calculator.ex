defmodule Calculator do
  def add(a, b), do: a + b
  def subtract(a, b), do: a - b
  def multiply(a, b), do: a * b
  def divide(a, b) when b != 0, do: a / b
  def divide(_a, 0), do: {:error, "Cannot divide by zero. Please provide a non-zero denominator."}

  def modulus(a, b) when b != 0, do: rem(a, b)
  def modulus(_a, 0), do: {:error, "Cannot calculate modulus with zero. Provide a non-zero divisor."}

  def power(a, b), do: a ** b

  def square_root(a) when a >= 0, do: :math.sqrt(a)
  def square_root(_a), do: {:error, "Square root of a negative number is not supported. Use a positive number."}
end

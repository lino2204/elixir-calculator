defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "addition works" do
    assert Calculator.add(2, 3) == 5
  end

  test "addition with negative numbers" do
    assert Calculator.add(-2, 3) == 1
    assert Calculator.add(-2, -3) == -5
  end

  test "addition with decimals" do
    assert Calculator.add(2.5, 3.2) == 5.7
  end

  test "subtraction works" do
    assert Calculator.subtract(5, 3) == 2
  end

  test "subtraction with negative numbers" do
    assert Calculator.subtract(-5, -3) == -2
    assert Calculator.subtract(-5, 3) == -8
  end

  test "subtraction with decimals" do
    assert Calculator.subtract(5.5, 3.2) == 2.3
  end

  test "multiplication works" do
    assert Calculator.multiply(2, 3) == 6
  end

  test "multiplication with negative numbers" do
    assert Calculator.multiply(-2, 3) == -6
    assert Calculator.multiply(-2, -3) == 6
  end

  test "multiplication with decimals" do
    assert Calculator.multiply(2.5, 3.2) == 8.0
  end

  test "division works" do
    assert Calculator.divide(6, 3) == 2.0
  end

  test "division by zero returns an error" do
    assert Calculator.divide(4, 0) == {:error, "Cannot divide by zero. Please provide a non-zero denominator."}
  end

  test "division with decimals" do
    assert Calculator.divide(5.5, 2.2) == 2.5
  end

  test "modulus works" do
    assert Calculator.modulus(5, 2) == 1
  end

  test "modulus by zero returns an error" do
    assert Calculator.modulus(5, 0) == {:error, "Cannot calculate modulus with zero. Provide a non-zero divisor."}
  end

  test "power works" do
    assert Calculator.power(2, 3) == 8
  end

  test "power with negative exponent" do
    assert Calculator.power(2, -2) == 0.25
  end

  test "power with decimal exponent" do
    assert Calculator.power(16, 0.5) == 4.0  # Square root of 16
  end

  test "square root works" do
    assert Calculator.square_root(9) == 3.0
  end

  test "square root of a negative number returns an error" do
    assert Calculator.square_root(-9) == {:error, "Square root of a negative number is not supported. Use a positive number."}
  end

  test "addition with large numbers" do
    assert Calculator.add(1_000_000_000, 2_000_000_000) == 3_000_000_000
  end

  test "substract with large numbers" do
    assert Calculator.subtract(1_000_000_000, 2_000_000_000) == -1_000_000_000
  end

  test "multiplication with large numbers" do
    assert Calculator.multiply(1_000_000, 1_000_000) == 1_000_000_000_000
  end
end

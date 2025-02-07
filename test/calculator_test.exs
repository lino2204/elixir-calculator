defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "addition works" do
    assert Calculator.add(2, 3) == 5
  end

  test "division by zero returns an error" do
    assert Calculator.divide(4, 0) == {:error, "Cannot divide by zero"}
  end

  test "modulus works" do
    assert Calculator.modulus(5, 2) == 1
  end

  test "modulus by zero returns an error" do
    assert Calculator.modulus(5, 0) == {:error, "Cannot divide by zero"}
  end

  test "power works" do
    assert Calculator.power(2, 3) == 8
  end

  test "square root works" do
    assert Calculator.square_root(9) == 3.0
  end

  test "square root of a negative number returns an error" do
    assert Calculator.square_root(-9) == {:error, "Cannot calculate square root of a negative number"}
  end
end

defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "addition works" do
    assert Calculator.add(2, 3) == 5
  end

  test "division by zero returns an error" do
    assert Calculator.divide(4, 0) == {:error, "Cannot divide by zero"}
  end
end

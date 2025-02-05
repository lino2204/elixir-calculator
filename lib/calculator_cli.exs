Code.require_file("calculator.ex", "lib")

defmodule CalculatorCLI do
  def start do
    IO.puts("Enter first number:")
    a = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("Enter second number:")
    b = IO.gets("> ") |> String.trim() |> String.to_integer()

    IO.puts("Choose an operation (+, -, *, /):")
    op = IO.gets("> ") |> String.trim()

    result =
      case op do
        "+" -> Calculator.add(a, b)
        "-" -> Calculator.subtract(a, b)
        "*" -> Calculator.multiply(a, b)
        "/" -> Calculator.divide(a, b)
        _ -> "Invalid operation"
      end

    IO.puts("Result: #{inspect(result)}")
  end
end

CalculatorCLI.start()

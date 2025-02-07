Code.require_file("calculator.ex", "lib")

defmodule CalculatorCLI do
  def start do
    IO.puts("Enter operation (add, subtract, multiply, divide, modulus, power, sqrt):")
    op = String.trim(IO.gets("> "))

    case op do
      "sqrt" ->
        number = get_number("Enter a number:")
        process_result(Calculator.square_root(number))

      _ ->
        num1 = get_number("Enter first number:")
        num2 = get_number("Enter second number:")
        result = calculate(op, num1, num2)
        process_result(result)
    end
  end

  # Get a valid number from user
  defp get_number(prompt) do
    IO.puts(prompt)
    input = String.trim(IO.gets("> "))

    case Integer.parse(input) do
      {num, _} -> num
      :error -> handle_invalid_input()
    end
  end

  # Perform the calculation based on user input
  defp calculate("add", a, b), do: Calculator.add(a, b)
  defp calculate("subtract", a, b), do: Calculator.subtract(a, b)
  defp calculate("multiply", a, b), do: Calculator.multiply(a, b)
  defp calculate("divide", a, b), do: Calculator.divide(a, b)
  defp calculate("modulus", a, b), do: Calculator.modulus(a, b)
  defp calculate("power", a, b), do: Calculator.power(a, b) |> round()
  defp calculate(_, _, _), do: {:error, "Invalid operation"}

  # Handle result output
  defp process_result({:error, message}), do: IO.puts("Error: #{message}")
  defp process_result(result), do: IO.puts("Result: #{inspect(result)}")

  # Handle invalid input
  defp handle_invalid_input do
    IO.puts("Invalid input. Please enter a valid number.")
    System.halt(1)
  end
end

CalculatorCLI.start()

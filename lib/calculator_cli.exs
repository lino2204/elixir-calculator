Code.require_file("calculator.ex", "lib")

defmodule CalculatorCLI do

  def start do
    IO.puts("Welcome to the Calculator CLI!")
    loop()
  end

  defp loop do
    IO.puts("\nEnter operation (add, subtract, multiply, divide, modulus, power, sqrt) or 'q' to quit:")
    op = get_input("> ")

    case op do
      "q" ->
        IO.puts("Goodbye!")
        System.halt(0)

      "sqrt" ->
        number = get_number("Enter a number:")
        process_result(Calculator.square_root(number))

      _ ->
        num1 = get_number("Enter first number:")
        num2 = get_number("Enter second number:")
        result = calculate(op, num1, num2)
        process_result(result)
    end

    loop()
  end

  # Get input from user
  defp get_input(prompt) do
    IO.write(prompt)
    String.trim(IO.gets(""))
  end

  # Get a valid number from user
  defp get_number(prompt) do
    IO.puts(prompt)
    input = get_input("> ")

    case Float.parse(input) do
      {num, _} -> num
      :error ->
        IO.puts("Invalid input. Please enter a valid number.")
        get_number(prompt)  # Ask again
    end
  end

  # Perform the calculation based on user input
  defp calculate("add", a, b), do: Calculator.add(a, b)
  defp calculate("subtract", a, b), do: Calculator.subtract(a, b)
  defp calculate("multiply", a, b), do: Calculator.multiply(a, b)
  defp calculate("divide", a, b), do: Calculator.divide(a, b)
  defp calculate("modulus", a, b), do: Calculator.modulus(trunc(a), trunc(b)) # Modulus only works with integers
  defp calculate("power", a, b), do: Calculator.power(a, b) |> round()
  defp calculate(_, _, _), do: {:error, "Invalid operation"}

  # Handle result output
  defp process_result({:error, message}), do: IO.puts("Error: #{message}")
  defp process_result(result), do: IO.puts("Result: #{inspect(result)}")

end

CalculatorCLI.start()

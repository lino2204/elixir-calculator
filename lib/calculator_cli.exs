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
        number = get_number("Enter a number (must be non-negative):", allow_negative: false)
        process_result(Calculator.square_root(number))

      _ when op in ["add", "subtract", "multiply", "divide", "modulus", "power"]->
        num1 = get_number("Enter first number:")
        num2 = get_number("Enter second number:")

        if op in ["divide", "modulus"] and num2 == 0 do
          IO.puts("Error: Cannot #{op} by zero. Please enter a valid number.")
          loop()
        else
          process_result(calculate(op, num1, num2))
        end

      _ ->
        IO.puts("Invalid operation! Please choose from: add, subtract, multiply, divide, modulus, power, sqrt.")
    end

    loop()
  end

  # Get input from user
  defp get_input(prompt) do
    IO.write(prompt)
    input = IO.gets("") |> String.trim()

    if input == "" do
      IO.puts("Input cannot be empty. Try again.")
      get_input(prompt)
    else
      input
    end
  end

  # Get a valid number from user
  defp get_number(prompt, opts \\ []) do
    IO.puts(prompt)
    input = get_input("> ")

    case Float.parse(input) do
      {num, _} ->
        if Keyword.get(opts, :allow_negative, true) == false and num < 0 do
          IO.puts("Invalid input. Please enter a non-negative number.")
          get_number(prompt, opts)
        else
          num
        end

      :error ->
        IO.puts("Invalid input. Please enter a valid number.")
        get_number(prompt, opts)  # Ask again
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

# Calculator

**Basic calculator with maths operations**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `calculator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:calculator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/calculator>.

Command to create a project

```bash
mix new . --module Calculator --app calculator
```

## Explaination

### Source Code

```bash
/lib
```

This folder contains the Elixir Application Code

```bash
lib/calculator.ex
```

Purpose:

- Defines a module with calculator functions.
- The test cases will check if these functions work correctly.

```bash
lib/calculator_cli.exs
```

Purpose:

- This is a script (.exs file) that interacts with the user via IO.puts and IO.gets.
- It loads Calculator.ex to perform calculations.

### Tests

```bash
/test
```

This folder contains unit tests using ExUnit

```bash
test/calculator_test.exs
```

Unit Tests

- Defines test cases for Calculator using ExUnit.
- assert checks if function outputs match expectations.
- doctest Calculator runs examples from documentation as tests

To run tests

```bash
mix test
```

```bash
test/test_helper.exs
```

Test Setup

 Purpose:

- This file starts ExUnit before running tests.
- Automatically loaded when running mix test.

### Pipeline

```bash
mix deps.get
```

- mix is Elixir’s build tool (similar to npm for Node.js or pip for Python).
- deps.get tells mix to download and install dependencies listed in mix.exs.

```bash
mix compile --warnings-as-errors
```

- This compiles all Elixir source files in the lib/ directory.
- It ensures that all modules and functions are valid before running tests

```bash
mix test
```

Runs all test files inside the test/ directory.
Executes assertions to check if functions return expected results.
If a test fails, the GitHub Actions workflow stops and prevents merging
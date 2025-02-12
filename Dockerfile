FROM elixir:1.18
WORKDIR /app
COPY mix.exs .
RUN mix deps.get
COPY . .
CMD ["elixir", "lib/calculator_cli.exs"]
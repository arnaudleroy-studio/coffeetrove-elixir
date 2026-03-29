# CoffeeTrove Elixir Client

Elixir client for the [CoffeeTrove](https://coffeetrove.com) coffee data API. Access 440K+ cafes, brewing guides, and coffee data.

## Installation

Add `coffeetrove` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coffeetrove, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
CoffeeTrove.version()
# => "0.1.0"

CoffeeTrove.base_url()
# => "https://coffeetrove.com"
```

## Links

- [Homepage](https://coffeetrove.com)
- [Documentation](https://coffeetrove.com/knowledge)
- [GitHub](https://github.com/arnaudleroy-studio/coffeetrove-elixir)

## License

MIT License. See [LICENSE](LICENSE) for details.

# CoffeeTrove

[![Hex.pm](https://img.shields.io/hexpm/v/coffeetrove.svg)](https://hex.pm/packages/coffeetrove)

Elixir toolkit for working with coffee data from CoffeeTrove, a discovery platform that maps
over 440,000 cafes across 195 countries. Beyond cafe locations, CoffeeTrove maintains a
knowledge base of brewing methods, bean origins, drink recipes, and equipment reviews, all
scored with its proprietary Golden Drop rating system.

## Installation

Add `coffeetrove` to your dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:coffeetrove, "~> 0.1.2"}
  ]
end
```

## Quick Start

Look up configuration for a specific data section:

```elixir
{:ok, section} = CoffeeTrove.section(:origins)
section.path
# "/knowledge/coffee-origins"
```

Build a cafe search query using keyword options and the pipe operator:

```elixir
[city: "tokyo", sort: :score, limit: 10]
|> CoffeeTrove.build_search()
|> IO.puts()
# "https://coffeetrove.com/api/cafes?city=tokyo&sort=score&limit=10"
```

Pattern match on brewing method metadata to extract steep times:

```elixir
for method <- CoffeeTrove.brewing_methods(),
    method.steep_minutes > 3 do
  "#{method.name}: #{method.steep_minutes} min steep"
end
|> Enum.join("\n")
|> IO.puts()
```

Retrieve all knowledge sections and their endpoint paths:

```elixir
CoffeeTrove.sections()
|> Enum.map(fn {key, %{path: path}} -> {key, path} end)
|> Enum.into(%{})
# %{origins: "/knowledge/coffee-origins", methods: "/knowledge/brewing-guides", ...}
```

## Available Data

CoffeeTrove covers the full specialty coffee ecosystem. The cafe directory spans independent
shops, local chains, and global brands in every major city, each with hours, location, and a
computed quality score. The knowledge hub includes 15 brewing methods from pour-over to
Turkish, 23 bean varieties with tasting notes and altitude ranges, 15 origin country profiles
detailing terroir and harvest seasons, and 17 drink recipes with preparation steps. An
encyclopedia of 164 coffee terms rounds out the reference material.

## Links

- [CoffeeTrove](https://coffeetrove.com) -- explore 440K+ cafes and coffee guides
- [Source Code](https://github.com/arnaudleroy-studio/coffeetrove-elixir)

## License

MIT -- see [LICENSE](LICENSE) for details.

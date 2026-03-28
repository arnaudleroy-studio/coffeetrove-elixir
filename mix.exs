defmodule CoffeeTrove.MixProject do
  use Mix.Project

  def project do
    [
      app: :coffeetrove,
      version: "0.1.0",
      elixir: "~> 1.14",
      description: "Access 440K+ cafes, brewing guides, and coffee data from CoffeeTrove.",
      package: package(),
      docs: docs(),
      source_url: "https://github.com/arnaudleroy-studio/coffeetrove-elixir",
      homepage_url: "https://coffeetrove.com"
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "Homepage" => "https://coffeetrove.com",
        "GitHub" => "https://github.com/arnaudleroy-studio/coffeetrove-elixir",
        "Documentation" => "https://coffeetrove.com/knowledge"
      }
    ]
  end

  defp docs do
    [main: "CoffeeTrove"]
  end
end

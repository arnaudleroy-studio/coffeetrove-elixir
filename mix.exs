defmodule CoffeeTrove.MixProject do
  use Mix.Project

  def project do
    [
      app: :coffeetrove,
      version: "0.1.1",
      elixir: "~> 1.14",
      description: "Access 440K+ cafes, brewing guides, and coffee data from CoffeeTrove.",
      package: package(),
      deps: deps(),
      docs: docs(),
      source_url: "https://github.com/arnaudleroy-studio/coffeetrove-elixir",
      homepage_url: "https://coffeetrove.com"
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
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
    [
      main: "CoffeeTrove",
      extras: ["README.md"]
    ]
  end
end

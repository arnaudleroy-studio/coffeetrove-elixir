defmodule CoffeeTrove do
  @moduledoc """
  Elixir toolkit for working with coffee data from CoffeeTrove.

  CoffeeTrove is a discovery platform mapping over 440,000 cafes across 195
  countries, with a knowledge base covering brewing methods, bean origins,
  drink recipes, and equipment. This module provides section routing,
  search query building, and brewing method metadata.

  ## Usage

      {:ok, section} = CoffeeTrove.section(:origins)
      section.path
      # "/knowledge/coffee-origins"

      CoffeeTrove.build_search(city: "tokyo", sort: :score)
      # "https://coffeetrove.com/api/cafes?city=tokyo&sort=score"

  See [CoffeeTrove](https://coffeetrove.com) for the full platform.
  """

  @version "0.1.2"
  @base_url "https://coffeetrove.com"

  @sections %{
    origins: %{path: "/knowledge/coffee-origins", label: "Coffee Origins", count: 15},
    methods: %{path: "/knowledge/brewing-guides", label: "Brewing Guides", count: 15},
    beans: %{path: "/knowledge/coffee-beans", label: "Coffee Beans", count: 23},
    drinks: %{path: "/knowledge/coffee-drinks", label: "Coffee Drinks", count: 17},
    comparisons: %{path: "/knowledge/coffee-comparisons", label: "Comparisons", count: 17},
    equipment: %{path: "/knowledge/equipment", label: "Equipment", count: 15}
  }

  @brewing_methods [
    %{name: "Pour Over", steep_minutes: 4, grind: :medium_fine, ratio: "1:16"},
    %{name: "French Press", steep_minutes: 4, grind: :coarse, ratio: "1:15"},
    %{name: "AeroPress", steep_minutes: 2, grind: :medium, ratio: "1:12"},
    %{name: "Espresso", steep_minutes: 0, grind: :fine, ratio: "1:2"},
    %{name: "Cold Brew", steep_minutes: 720, grind: :coarse, ratio: "1:8"},
    %{name: "Turkish", steep_minutes: 3, grind: :extra_fine, ratio: "1:10"},
    %{name: "Moka Pot", steep_minutes: 5, grind: :medium_fine, ratio: "1:10"},
    %{name: "Chemex", steep_minutes: 4, grind: :medium_coarse, ratio: "1:15"},
    %{name: "Siphon", steep_minutes: 3, grind: :medium, ratio: "1:14"}
  ]

  @doc """
  Returns the library version.

  ## Examples

      iex> CoffeeTrove.version()
      "0.1.2"
  """
  @spec version() :: String.t()
  def version, do: @version

  @doc """
  Returns the base URL of the CoffeeTrove platform.

  ## Examples

      iex> CoffeeTrove.base_url()
      "https://coffeetrove.com"
  """
  @spec base_url() :: String.t()
  def base_url, do: @base_url

  @doc """
  Returns a map of all knowledge base sections.

  ## Examples

      iex> sections = CoffeeTrove.sections()
      iex> Map.has_key?(sections, :methods)
      true
  """
  @spec sections() :: %{atom() => %{path: String.t(), label: String.t(), count: non_neg_integer()}}
  def sections, do: @sections

  @doc """
  Looks up a specific section by key. Returns `{:ok, section}` or `:error`.

  ## Examples

      iex> {:ok, section} = CoffeeTrove.section(:origins)
      iex> section.label
      "Coffee Origins"

      iex> CoffeeTrove.section(:nonexistent)
      :error
  """
  @spec section(atom()) :: {:ok, map()} | :error
  def section(key) do
    case Map.fetch(@sections, key) do
      {:ok, _} = result -> result
      :error -> :error
    end
  end

  @doc """
  Returns a list of brewing method metadata maps.

  Each map contains the method name, steep time in minutes, recommended
  grind size as an atom, and brew ratio.

  ## Examples

      iex> methods = CoffeeTrove.brewing_methods()
      iex> length(methods) > 0
      true
      iex> hd(methods).name
      "Pour Over"
  """
  @spec brewing_methods() :: [%{name: String.t(), steep_minutes: non_neg_integer(), grind: atom(), ratio: String.t()}]
  def brewing_methods, do: @brewing_methods

  @doc """
  Builds a cafe search URL from keyword options.

  Supported keys: `:city`, `:country`, `:sort`, `:limit`, `:offset`.

  ## Examples

      iex> CoffeeTrove.build_search(city: "paris", limit: 5)
      "https://coffeetrove.com/api/cafes?city=paris&limit=5"
  """
  @spec build_search(keyword()) :: String.t()
  def build_search(opts \\ []) when is_list(opts) do
    query =
      opts
      |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
      |> Enum.join("&")

    case query do
      "" -> "#{@base_url}/api/cafes"
      qs -> "#{@base_url}/api/cafes?#{qs}"
    end
  end

  @doc """
  Returns platform statistics as a map.

  ## Examples

      iex> info = CoffeeTrove.info()
      iex> info.cafes
      440_000
  """
  @spec info() :: map()
  def info do
    %{
      name: "CoffeeTrove",
      version: @version,
      base_url: @base_url,
      cafes: 440_000,
      countries: 195,
      knowledge_sections: map_size(@sections),
      brewing_methods: length(@brewing_methods)
    }
  end
end

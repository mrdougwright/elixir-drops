defmodule WeatherApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather_app,
      version: "0.1.0",
      elixir: "~> 1.9",
      compilers: [:phoenix] ++ Mix.compilers,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {WeatherApp.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      {:metex, git: "https://github.com/adsteel/metex.git"},
      {:jason, "~> 1.1"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_html, "~> 2.10"},
      {:plug_cowboy, "~> 1.0"}
    ]
  end
end

defmodule BitcoinRpc.MixProject do
  use Mix.Project

  def project do
    [
      app: :bitcoin_rpc,
      name: "Bitcoin RPC",
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: description(),
      deps: deps(),
      source_url: "https://github.com/around25/bitcoin_rpc",
      preferred_cli_env: ["coveralls": :test, "coveralls.travis": :test, "coveralls.html": :test],
    ]
  end

  defp description do
    """
    Interact with a Bitcoin node through JSON-RPC and get notifications on configured events like incomming transactions.
    """
  end

  defp package do
    [
      maintainers: ["Cosmin Harangus"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/around25/bitcoin_rpc"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.1"},
      {:ex_doc, "~> 0.18.3", only: :dev, runtime: false},
      {:excoveralls, "~> 0.8.2", only: :test},
    ]
  end
end

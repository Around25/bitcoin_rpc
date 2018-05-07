use Mix.Config

config :bitcoin_rpc,
  host: "localhost",
  port: "18333",
  user: "myuser",
  pass: "mypass",
  callback: nil

config :logger, level: :warn

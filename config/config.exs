use Mix.Config

config :bitcoin_rpc,
  host: "localhost",
  port: "18333",
  user: "",
  pass: "",
  callback: nil # {BitcoinWallet, :notify_queue}

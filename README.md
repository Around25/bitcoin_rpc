# BitcoinRpc

Bitcoin RPC is an Elixir library to make RPC calls to a bitcoin node and listen to 
incomming transactions for the wallet.

## Installation

This package is [available on Hex](https://hex.pm/packages/bitcoin_rpc), and it can be installed 
by adding `bitcoin_rpc` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bitcoin_rpc, "~> 0.1.0"}
  ]
end
```

## Documentation
The docs can be found at [https://hexdocs.pm/bitcoin_rpc](https://hexdocs.pm/bitcoin_rpc).

## Todos
* Update calls to use the latest version from this documentation: https://bitcoin-rpc.github.io/

## License

MIT License

Copyright (c) 2018 Around25 SRL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
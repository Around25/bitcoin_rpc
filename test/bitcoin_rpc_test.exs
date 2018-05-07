defmodule BitcoinRpcTest do
  use ExUnit.Case
  doctest BitcoinRpc

  test "greets the world" do
    assert BitcoinRpc.hello() == :world
  end
end

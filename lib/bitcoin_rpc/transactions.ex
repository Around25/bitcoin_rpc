defmodule BitcoinRpc.Transactions do
  @moduledoc """
  BitcoinRpc.Transactions allows you to stay connected to an bitcoin wallet and be notified of incomming
  or outgoing transactions that affect that wallet.

  ## Examples

  Connect to the bitcoin node using the configured BitcoinRpc connection and listen for new transactions
  that affect the wallet since the "last_block" and check for new transactions every 60 seconds.
  The list of transactions will include all transactions with a number of confirmations lower or equal to
  the given confirmation number. This will cause some transactions to be received multiple times until the
  last_block is updated and the number of confirmations is above the threashold.
  See [ListSinceBlock RPC method](https://bitcoin.org/en/developer-reference#listsinceblock) for more details.

      iex> BitcoinRpc.Transactions.start_link([timeout: 60, last_block: "", confirmations: 1, callback: {MyModule, :handle_transaction}])
      {:ok, pid}

  MyModule looks something like this:

      defmodule MyModule do

        def handle_transaction(transactions, last_block) do
          # do something with the transaction
          IO.inspect last_block
          IO.inspect transactions
        end

      end

  """
  use GenServer
  alias BitcoinRpc

  @doc """
  Start listening for incomming transactions that can affect the current wallet

      iex> BitcoinRpc.Transactions.start_link([timeout: 60, last_block: "", confirmations: 1, callback: {MyModule, :handle_transaction}])
      {:ok, pid}

  """
  def start_link(opts \\ [timeout: 60, last_block: "", confirmations: 1]) do
    opts = [
      timeout: Keyword.get(opts, :timeout, 60),
      last_block: Keyword.get(opts, :last_block, ""),
      confirmations: Keyword.get(opts, :confirmations, 1),
      callback: Keyword.get(opts, :callback, Application.get_env(:bitcoin_rpc, :callback, nil))
    ]
    case opts[:callback] do
      {_, _} -> GenServer.start_link(__MODULE__, opts, name: __MODULE__)
      callback -> {:error, "[BitcoinRPC] Invalid callback method received #{inspect callback}"}
    end
  end

  @doc """
  Initiate the scheduler and configure the initial state of the listener
  """
  def init(opts) do
    ticker(opts[:timeout])
    {:ok, [
      last_block: opts[:last_block],
      confirmations: opts[:confirmations],
      callback: opts[:callback],
    ]}
  end

  @doc """
  Handle ticker event and check for new transactions since the last scanned block
  """
  def handle_info({:ticker, timeout}, state) do
    ticker(timeout)
    confirmations = state[:confirmations]
    {module, method} = state[:callback]
    resp = BitcoinRpc.list_since_block(state[:last_block], confirmations)
    last_block = case resp do
      {:ok, %{
        "lastblock" => last_block,
        "transactions" => transactions,
      }} ->
        apply(module, method, [transactions, last_block])
        last_block
      {:error, _} -> state[:last_block]
    end

    {:noreply, Keyword.put(state, :last_block, last_block)}
  end
  def handle_info(msg, state), do: super(msg, state)

  defp ticker(timeout), do: Process.send_after(self(), {:ticker, timeout}, timeout * 1000)

end

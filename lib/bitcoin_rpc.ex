defmodule BitcoinRpc do
  @moduledoc """
  Module to connect to a bitcoin node and make requests to the node through JSON RPC calls.

  ## Configuration

      config :bitcoin_rpc,
        host: "localhost",
        port: "18333",
        user: "myuser",
        pass: "mypass",
        callback: nil # required only for BitcoinRpc.Transactions. Ex: {BitcoinWallet, :notify_queue}

  ## Examples

      iex> BitcoinRpc.get_new_address() # get a new address for the default account
      {:ok, "2N3jU3uoaU7s3fVv5RPyNrxjW8DbdvQAPvk"}

  """

  @doc """
  https://bitcoin.org/en/developer-reference#abandontransaction
  """
  def abandon_transaction(txid), do: bitcoin_rpc("abandontransaction", [txid])

  @doc """
  https://bitcoin.org/en/developer-reference#addmultisigaddress
  """
  def add_multi_sig_address(required, addresses), do: bitcoin_rpc("addmultisigaddress", [required, addresses])

  @doc """
  https://bitcoin.org/en/developer-reference#addnode
  """
  def add_node(node, command), do: bitcoin_rpc("addnode", [node, command])

  @doc """
  https://bitcoin.org/en/developer-reference#addwitnessaddress
  """
  def add_witness_address(address), do: bitcoin_rpc("addwitnessaddress", [address])

  @doc """
  https://bitcoin.org/en/developer-reference#backupwallet
  """
  def backup_wallet(destination), do: bitcoin_rpc("backupwallet", [destination])

  @doc """
  https://bitcoin.org/en/developer-reference#bumpfee
  """
  def bump_fee(txid), do: bitcoin_rpc("bumpfee", [txid])
  def bump_fee(txid, options), do: bitcoin_rpc("bumpfee", [txid, options])

  @doc """
  https://bitcoin.org/en/developer-reference#clearbanned
  """
  def clear_banned(), do: bitcoin_rpc("clearbanned")

  @doc """
  https://bitcoin.org/en/developer-reference#createmultisig
  """
  def create_multi_sig(required, addresses), do: bitcoin_rpc("createmultisig", [required, addresses])

  @doc """
  https://bitcoin.org/en/developer-reference#createrawtransaction
  """
  def create_raw_transaction(inputs, outputs), do: bitcoin_rpc("createrawtransaction", [inputs, outputs])
  def create_raw_transaction(inputs, outputs, locktime), do: bitcoin_rpc("createrawtransaction", [inputs, outputs, locktime])

  @doc """
  https://bitcoin.org/en/developer-reference#decoderawtransaction
  """
  def decode_raw_transaction(transaction), do: bitcoin_rpc("decoderawtransaction", [transaction])

  @doc """
  https://bitcoin.org/en/developer-reference#decodescript
  """
  def decode_script(script), do: bitcoin_rpc("decodescript", [script])

  @doc """
  https://bitcoin.org/en/developer-reference#disconnectnode
  """
  def disconnect_node(address), do: bitcoin_rpc("disconnectnode", [address])
  @doc """
  https://bitcoin.org/en/developer-reference#dumpprivkey
  """
  def dump_priv_key(address), do: bitcoin_rpc("dumpprivkey", [address])
  @doc """
  https://bitcoin.org/en/developer-reference#dumpwallet
  """
  def dump_wallet(filename), do: bitcoin_rpc("dumpwallet", [filename])
  @doc """
  https://bitcoin.org/en/developer-reference#encryptwallet
  """
  def encrypt_wallet(passphrase), do: bitcoin_rpc("encryptwallet", [passphrase])
  @doc """
  https://bitcoin.org/en/developer-reference#estimatefee
  """
  def estimate_fee(blocks), do: bitcoin_rpc("estimatefee", [blocks])
  @doc """
  https://bitcoin.org/en/developer-reference#estimatepriority
  """
  def estimate_priority(blocks), do: bitcoin_rpc("estimatepriority", [blocks])
  @doc """
  https://bitcoin.org/en/developer-reference#fundrawtransaction
  """
  def fund_raw_transaction(hexstring, options), do: bitcoin_rpc("fundrawtransaction", [hexstring, options])
  @doc """
  https://bitcoin.org/en/developer-reference#generate
  """
  def generate(blocks), do: bitcoin_rpc("generate", [blocks])
  def generate(blocks, maxtries), do: bitcoin_rpc("generate", [blocks, maxtries])
  @doc """
  https://bitcoin.org/en/developer-reference#generatetoaddress
  """
  def generate_to_address(blocks, address), do: bitcoin_rpc("generatetoaddress", [blocks, address])
  def generate_to_address(blocks, address, maxtries), do: bitcoin_rpc("generatetoaddress", [blocks, address, maxtries])
  @doc """
  https://bitcoin.org/en/developer-reference#getaccountaddress
  """
  def get_account_address(account), do: bitcoin_rpc("getaccountaddress", [account])
  @doc """
  https://bitcoin.org/en/developer-reference#getaccount
  """
  def get_account(address), do: bitcoin_rpc("getaccount", [address])
  @doc """
  https://bitcoin.org/en/developer-reference#getaddednodeinfo
  """
  def get_added_node_info(details), do: bitcoin_rpc("getaddednodeinfo", [details])
  def get_added_node_info(details, node), do: bitcoin_rpc("getaddednodeinfo", [details, node])
  @doc """
  https://bitcoin.org/en/developer-reference#getaddressesbyaccount
  """
  def get_addresses_by_account(account), do: bitcoin_rpc("getaddressesbyaccount", [account])
  @doc """
  https://bitcoin.org/en/developer-reference#getbalance
  """
  def get_balance(account \\ "", confirmations \\ 1, watch_only \\ false), do: bitcoin_rpc("getbalance", [account, confirmations, watch_only])
  @doc """
  https://bitcoin.org/en/developer-reference#getbestblockhash
  """
  def get_best_block_hash(), do: bitcoin_rpc("getbestblockhash", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getblock
  """
  def get_block(hash, format \\ 1), do: bitcoin_rpc("getblock", [hash, format])
  @doc """
  https://bitcoin.org/en/developer-reference#getblockchaininfo
  """
  def get_block_chain_info(), do: bitcoin_rpc("getblockchaininfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getblockcount
  """
  def get_block_count(), do: bitcoin_rpc("getblockcount", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getblockhash
  """
  def get_block_hash(block_height), do: bitcoin_rpc("getblockhash", [block_height])
  @doc """
  https://bitcoin.org/en/developer-reference#getblockheader
  """
  def get_block_header(header_hash, format \\ true), do: bitcoin_rpc("getblockheader", [header_hash, format])
  @doc """
  https://bitcoin.org/en/developer-reference#getblocktemplate
  """
  def get_block_template(params \\ []), do: bitcoin_rpc("getblocktemplate", params)
  @doc """
  https://bitcoin.org/en/developer-reference#getchaintips
  """
  def get_chain_tips(), do: bitcoin_rpc("getchaintips", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getconnectioncount
  """
  def get_connection_count(), do: bitcoin_rpc("getconnectioncount", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getdifficulty
  """
  def get_difficulty(), do: bitcoin_rpc("getdifficulty", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getgenerate
  """
  def get_generate(), do: :deprecated
  @doc """
  https://bitcoin.org/en/developer-reference#gethashespersec
  """
  def get_hashes_per_sec(), do: :deprecated
  @doc """
  https://bitcoin.org/en/developer-reference#getinfo
  """
  def get_info(), do: bitcoin_rpc("getinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getmemoryinfo
  """
  def get_memory_info(), do: bitcoin_rpc("getmemoryinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getmempoolancestors
  """
  def get_mem_pool_ancestors(address, format \\ false), do: bitcoin_rpc("getmempoolancestors", [address, format])
  @doc """
  https://bitcoin.org/en/developer-reference#getmempooldescendants
  """
  def get_mem_pool_descendants(address, format \\ false), do: bitcoin_rpc("getmempooldescendants", [address, format])
  @doc """
  https://bitcoin.org/en/developer-reference#getmempoolentry
  """
  def get_mem_pool_entry(address), do: bitcoin_rpc("getmempoolentry", [address])
  @doc """
  https://bitcoin.org/en/developer-reference#getmempoolinfo
  """
  def get_mem_pool_info(), do: bitcoin_rpc("getmempoolinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getmininginfo
  """
  def get_mining_info(), do: bitcoin_rpc("getmininginfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getnettotals
  """
  def get_net_totals(), do: bitcoin_rpc("getnettotals", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getnetworkhashps
  """
  def get_network_hash_ps(blocks \\ 120, height \\ -1), do: bitcoin_rpc("getnetworkhashps", [blocks, height])
  @doc """
  https://bitcoin.org/en/developer-reference#getnetworkinfo
  """
  def get_network_info(), do: bitcoin_rpc("getnetworkinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getnewaddress
  """
  def get_new_address(account \\ "", address_type \\ "p2sh-segwit"), do: bitcoin_rpc("getnewaddress", [account, address_type])
  @doc """
  https://bitcoin.org/en/developer-reference#getpeerinfo
  """
  def get_peer_info(), do: bitcoin_rpc("getpeerinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getrawchangeaddress
  """
  def get_raw_change_address(), do: bitcoin_rpc("getrawchangeaddress", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getrawmempool
  """
  def get_raw_mem_pool(format \\ false), do: bitcoin_rpc("getrawmempool", [format])
  @doc """
  https://bitcoin.org/en/developer-reference#getrawtransaction
  """
  def get_raw_transaction(txid, format \\ false), do: bitcoin_rpc("getrawtransaction", [txid, format])
  @doc """
  https://bitcoin.org/en/developer-reference#getreceivedbyaccount
  """
  def get_received_by_account(account, confirmations \\ 1), do: bitcoin_rpc("getreceivedbyaccount", [account, confirmations])
  @doc """
  https://bitcoin.org/en/developer-reference#getreceivedbyaddress
  """
  def get_received_by_address(account, confirmations \\ 1), do: bitcoin_rpc("getreceivedbyaddress", [account, confirmations])
  @doc """
  https://bitcoin.org/en/developer-reference#gettransaction
  """
  def get_transaction(txid, watch_only \\ false), do: bitcoin_rpc("gettransaction", [txid, watch_only])
  @doc """
  https://bitcoin.org/en/developer-reference#gettxout
  """
  def get_tx_out(txid, vout, unconfirmed \\ false), do: bitcoin_rpc("gettxout", [txid, vout, unconfirmed])
  @doc """
  https://bitcoin.org/en/developer-reference#gettxoutproof
  """
  def get_tx_out_proof(txid), do: bitcoin_rpc("gettxoutproof", [txid])
  def get_tx_out_proof(txid, hash), do: bitcoin_rpc("gettxoutproof", [txid, hash])
  @doc """
  https://bitcoin.org/en/developer-reference#gettxoutsetinfo
  """
  def get_tx_out_set_info(), do: bitcoin_rpc("gettxoutsetinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getunconfirmedbalance
  """
  def get_unconfirmed_balance(), do: bitcoin_rpc("getunconfirmedbalance", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getwalletinfo
  """
  def get_wallet_info(), do: bitcoin_rpc("getwalletinfo", [])
  @doc """
  https://bitcoin.org/en/developer-reference#getwork
  """
  def get_work(), do: :deprecated
  @doc """
  https://bitcoin.org/en/developer-reference#help
  """
  def help(), do: bitcoin_rpc("help", [])
  def help(name), do: bitcoin_rpc("help", [name])
  @doc """
  https://bitcoin.org/en/developer-reference#importaddress
  """
  def import_address(address, account \\ "", rescan \\ true), do: bitcoin_rpc("importaddress", [address, account, rescan])
  @doc """
  https://bitcoin.org/en/developer-reference#importmulti
  """
  def import_multi(imports, options \\ %{ rescan: true }), do: bitcoin_rpc("importmulti", [imports, options])
  @doc """
  https://bitcoin.org/en/developer-reference#importprivkey
  """
  def import_priv_key(private_key, account \\ "", rescan \\ true), do: bitcoin_rpc("importprivkey", [private_key, account, rescan])
  @doc """
  https://bitcoin.org/en/developer-reference#importprunedfunds
  """
  def import_pruned_funds(transaction, proof), do: bitcoin_rpc("importprunedfunds", [transaction, proof])
  @doc """
  https://bitcoin.org/en/developer-reference#importwallet
  """
  def import_wallet(filename), do: bitcoin_rpc("importwallet", [filename])
  @doc """
  https://bitcoin.org/en/developer-reference#keypoolrefill
  """
  def key_pool_refill(size \\ 100), do: bitcoin_rpc("keypoolrefill", [size])
  @doc """
  https://bitcoin.org/en/developer-reference#listaccounts
  """
  def list_accounts(confirmations \\ 1, watch_only \\ false), do: bitcoin_rpc("listaccounts", [confirmations, watch_only])
  @doc """
  https://bitcoin.org/en/developer-reference#listaddressgroupings
  """
  def list_address_groupings(), do: bitcoin_rpc("listaddressgroupings", [])
  @doc """
  https://bitcoin.org/en/developer-reference#listbanned
  """
  def list_banned(), do: bitcoin_rpc("listbanned", [])
  @doc """
  https://bitcoin.org/en/developer-reference#listlockunspent
  """
  def list_lock_unspent(), do: bitcoin_rpc("listlockunspent", [])
  @doc """
  https://bitcoin.org/en/developer-reference#listreceivedbyaccount
  """
  def list_received_by_account(confirmations \\ 1, empty \\ false, watch_only \\ false), do: bitcoin_rpc("listreceivedbyaccount", [confirmations, empty, watch_only])
  @doc """
  https://bitcoin.org/en/developer-reference#listreceivedbyaddress
  """
  def list_received_by_address(confirmations \\ 1, empty \\ false, watch_only \\ false), do: bitcoin_rpc("listreceivedbyaddress", [confirmations, empty, watch_only])
  @doc """
  List transactions since the given block.
  https://bitcoin.org/en/developer-reference#listsinceblock

  Example:
      BitcoinWallet.RpcClient.list_since_block("00000000000001867fb937891ba3777bd7eaee1dca3a0ba74ae2684bf21b1333", 1)
      {:ok,
      %{
        "lastblock" => "00000000005c7e378ee6845be8826f707607437b990ffeea6b23c269710209ec",
        "removed" => [],
        "transactions" => [
          %{
            "account" => "",
            "address" => "2N3jU3uoaU7s3fVv5RPyNrxjW8DbdvQAPvk",
            "amount" => 0.8425725,
            "bip125-replaceable" => "no",
            "blockhash" => "00000000005c7e378ee6845be8826f707607437b990ffeea6b23c269710209ec",
            "blockindex" => 22,
            "blocktime" => 1525548900,
            "category" => "receive",
            "confirmations" => 1,
            "label" => "",
            "time" => 1525548332,
            "timereceived" => 1525548332,
            "txid" => "ea87edc568f998b2c8871e1c8b7d677987e4605cc89a666c0f15d374dd52a9ee",
            "vout" => 0,
            "walletconflicts" => []
          }
        ]
      }}
  """
  def list_since_block(), do: bitcoin_rpc("listsinceblock", [])
  def list_since_block(hash), do: bitcoin_rpc("listsinceblock", [hash])
  def list_since_block(hash, confirmations), do: bitcoin_rpc("listsinceblock", [hash, confirmations])
  def list_since_block(hash, confirmations, watch_only), do: bitcoin_rpc("listsinceblock", [hash, confirmations, watch_only])
  @doc """
  https://bitcoin.org/en/developer-reference#listtransactions
  """
  def list_transactions(account \\ "", count \\ 10, skip \\ 0, watch_only \\ false), do: bitcoin_rpc("listtransactions", [account, count, skip, watch_only])
  @doc """
  https://bitcoin.org/en/developer-reference#listunspent
  """
  def list_unspent(min \\ 1, max \\ 9999999, addresses \\ []), do: bitcoin_rpc("listunspent", [min, max, addresses])
  @doc """
  https://bitcoin.org/en/developer-reference#lockunspent
  """
  def lock_unspent(unlock), do: bitcoin_rpc("lockunspent", [unlock])
  def lock_unspent(unlock, outputs), do: bitcoin_rpc("lockunspent", [unlock, outputs])
  @doc """
  https://bitcoin.org/en/developer-reference#move
  """
  def move(from, to, amount), do: bitcoin_rpc("move", [from, to, amount])
  def move(from, to, amount, unused), do: bitcoin_rpc("move", [from, to, amount, unused])
  def move(from, to, amount, unused, comment), do: bitcoin_rpc("move", [from, to, amount, unused, comment])
  @doc """
  https://bitcoin.org/en/developer-reference#ping-rpc
  """
  def ping(), do: bitcoin_rpc("ping", [])
  @doc """
  https://bitcoin.org/en/developer-reference#preciousblock
  """
  def precious_block(hash), do: bitcoin_rpc("preciousblock", [hash])
  @doc """
  https://bitcoin.org/en/developer-reference#prioritisetransaction
  """
  def prioritise_transaction(txid, priority, fee), do: bitcoin_rpc("prioritisetransaction", [txid, priority, fee])
  @doc """
  https://bitcoin.org/en/developer-reference#pruneblockchain
  """
  def prune_block_chain(height), do: bitcoin_rpc("pruneblockchain", [height])
  @doc """
  https://bitcoin.org/en/developer-reference#removeprunedfunds
  """
  def remove_pruned_funds(txid), do: bitcoin_rpc("removeprunedfunds", [txid])
  @doc """
  https://bitcoin.org/en/developer-reference#sendfrom
  """
  def send_from(from_account, address, amount, confirmations \\ 1, comment \\ "", comment_to \\ ""), do: bitcoin_rpc("sendfrom", [from_account, address, amount, confirmations, comment, comment_to])
  @doc """
  https://bitcoin.org/en/developer-reference#sendmany
  """
  def send_many(account, addresses, confirmations \\ 1, comment \\ "", subtract_fee \\ [], replaceable \\ true, conf_target \\ 3, estimate_mode \\ "ECONOMICAL"), do:
    bitcoin_rpc("sendmany", [account, addresses, confirmations, comment, subtract_fee, replaceable, conf_target, estimate_mode])
  @doc """
  https://bitcoin.org/en/developer-reference#sendrawtransaction
  """
  def send_raw_transaction(transaction, high_fees \\ false), do: bitcoin_rpc("sendrawtransaction", [transaction, high_fees])
  @doc """
  https://bitcoin.org/en/developer-reference#sendtoaddress
  """
  def send_to_address(address, amount, comment \\"", comment_to \\"", subtract_fee \\ false), do: bitcoin_rpc("sendtoaddress", [address, amount, comment, comment_to, subtract_fee])
  @doc """
  https://bitcoin.org/en/developer-reference#setaccount
  """
  def set_account(address, account), do: bitcoin_rpc("setaccount", [address, account])
  @doc """
  https://bitcoin.org/en/developer-reference#setban
  """
  def set_ban(ip, command), do: bitcoin_rpc("setban", [ip, command])
  def set_ban(ip, command, bantime), do: bitcoin_rpc("setban", [ip, command, bantime])
  def set_ban(ip, command, bantime, absolute), do: bitcoin_rpc("setban", [ip, command, bantime, absolute])
  @doc """
  https://bitcoin.org/en/developer-reference#setgenerate
  """
  def set_generate(), do: :deprecated
  @doc """
  https://bitcoin.org/en/developer-reference#setnetworkactive
  """
  def set_network_active(activate), do: bitcoin_rpc("setnetworkactive", [activate])
  @doc """
  https://bitcoin.org/en/developer-reference#settxfee
  """
  def set_tx_fee(fee), do: bitcoin_rpc("settxfee", [fee])
  @doc """
  https://bitcoin.org/en/developer-reference#signmessage
  """
  def sign_message(address, message), do: bitcoin_rpc("signmessage", [address, message])
  @doc """
  https://bitcoin.org/en/developer-reference#signmessagewithprivkey
  """
  def sign_message_with_priv_key(private_key, message), do: bitcoin_rpc("signmessagewithprivkey", [private_key, message])
  @doc """
  https://bitcoin.org/en/developer-reference#signrawtransaction
  """
  def sign_raw_transaction(transaction), do: bitcoin_rpc("signrawtransaction", [transaction])
  def sign_raw_transaction(transaction, dependencies), do: bitcoin_rpc("signrawtransaction", [transaction, dependencies])
  def sign_raw_transaction(transaction, dependencies, private_keys), do: bitcoin_rpc("signrawtransaction", [transaction, dependencies, private_keys])
  def sign_raw_transaction(transaction, dependencies, private_keys, sig_hash), do: bitcoin_rpc("signrawtransaction", [transaction, dependencies, private_keys, sig_hash])
  @doc """
  https://bitcoin.org/en/developer-reference#stop
  """
  def stop(), do: bitcoin_rpc("stop", [])
  @doc """
  https://bitcoin.org/en/developer-reference#submitblock
  """
  def submit_block(block), do: bitcoin_rpc("submitblock", [block])
  def submit_block(block, parameters), do: bitcoin_rpc("submitblock", [block, parameters])
  @doc """
  https://bitcoin.org/en/developer-reference#validateaddress
  """
  def validate_address(address), do: bitcoin_rpc("validateaddress", [address])
  @doc """
  https://bitcoin.org/en/developer-reference#verifychain
  """
  def verify_chain(), do: bitcoin_rpc("verifychain", [])
  def verify_chain(check_level), do: bitcoin_rpc("verifychain", [check_level])
  def verify_chain(check_level, number_of_blocks), do: bitcoin_rpc("verifychain", [check_level, number_of_blocks])
  @doc """
  https://bitcoin.org/en/developer-reference#verifymessage
  """
  def verify_message(address, signature, message), do: bitcoin_rpc("verifymessage", [address, signature, message])
  @doc """
  https://bitcoin.org/en/developer-reference#verifytxoutproof
  """
  def verify_tx_out_proof(proof), do: bitcoin_rpc("verifytxoutproof", [proof])
  @doc """
  https://bitcoin.org/en/developer-reference#walletlock
  """
  def wallet_lock(), do: bitcoin_rpc("walletlock", [])
  @doc """
  https://bitcoin.org/en/developer-reference#walletpassphrase
  """
  def wallet_passphrase(passphrase, seconds \\ 300), do: bitcoin_rpc("walletpassphrase", [passphrase, seconds])
  @doc """
  https://bitcoin.org/en/developer-reference#walletpassphrasechange
  """
  def wallet_passphrase_change(current, passphrase), do: bitcoin_rpc("walletpassphrasechange", [current, passphrase])

  defp bitcoin_rpc(method, params \\ []) do
    host = Application.get_env(:bitcoin_rpc, :host)
    port = Application.get_env(:bitcoin_rpc, :port)
    user = Application.get_env(:bitcoin_rpc, :user)
    pass = Application.get_env(:bitcoin_rpc, :pass)

    command = %{"jsonrpc": "2.0", "method": method, "params": params, "id": ""}
    headers = ["Authorization": "Basic " <> Base.encode64(user <> ":" <> pass)]
    options = [timeout: 30000, recv_timeout: 20000]
    url = "http://" <> host <> ":" <> to_string(port) <> "/"
    body = Poison.encode!(command)
    with {:ok, response} <- HTTPoison.post(url, body, headers, options),
         {:ok, metadata} <- Poison.decode(response.body),
         %{"error" => nil, "result" => result} <- metadata do
      {:ok, result}
    else
      %{"error" => reason} -> {:error, reason}
      error -> error
    end
  end
end

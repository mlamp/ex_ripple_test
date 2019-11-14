defmodule Ripple do
  use Tesla
  plug Tesla.Middleware.BaseUrl, "https://data.ripple.com/v2"
  plug Tesla.Middleware.JSON
  @moduledoc """
  Documentation for Ripple.
  """

  def get_latest_ledger() do
    get_ledger("")
  end

  def get_ledger(ledger_id) do
    {
      :ok,
      %Tesla.Env{
        body: %{
          "ledger" => asd
        }
      }
    } = get("/ledgers" <> add_ledger_id(ledger_id) <> "/?transactions=true&binary=false&expand=true")
    asd
  end

  def get_transactions_from_ledger(%{"transactions" => transactions}) do
    transactions
  end

  defp add_ledger_id("") do
    ""
  end

  defp add_ledger_id(ledger_id) do
    "/" <> ledger_id
  end

  defp tx_is_xrp_payment(
         %{
           "tx" => %{
             "TransactionType" => "Payment",
             "Amount" => amount
           }
         }
       ) when is_binary(amount) do
    true
  end
  defp tx_is_xrp_payment(_) do
    false
  end
  def filter_transfers(transactions) when is_list(transactions) do
    transactions
    |> Enum.filter(&tx_is_xrp_payment/1)
  end

  def get_addresses_from_txs(transactions) when is_list(transactions) do
    Enum.map(
      transactions,
      fn (%{
        "tx" => %{
          "Destination" => destination
        }
      }) -> destination
      end
    )
  end

  def test do
    get_ledger("51376176")
    |> get_transactions_from_ledger
    |> filter_transfers
    #    |> get_addresses_from_txs
  end
  @drop_to_xrp_rate 1_000_000
  def xrp_to_drops(xrp_amount) do
    Decimal.mult(xrp_amount, @drop_to_xrp_rate)
  end
  defp drops_to_xrp(drops_amount) when is_binary(drops_amount) do
    Decimal.div(drops_amount, @drop_to_xrp_rate)
  end

  def test2 do
    txs = get_ledger("51376176")
          |> get_transactions_from_ledger
          |> filter_transfers

    Enum.map(
      txs,
      fn %{
           "tx" => %{
             "Amount" => amount_str
           }
         } -> drops_to_xrp(amount_str) end
    )
    #    Decimal.parse()
  end

  @doc """
  Hello world.

  ## Examples

      iex> Ripple.hello()
      :world

  """
  def hello do
    :world
  end

end

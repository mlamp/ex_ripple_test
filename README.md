# Ripple

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ripple` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ripple, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ripple](https://hexdocs.pm/ripple).

Example of ledger (like a block), 3 transfers: 
API: https://data.ripple.com/v2/ledgers/9F2884EC4D749A142AB320A330B47AF414A64FB1089721BB269EEB6D6369EFE4?transactions=true&binary=false&expand=true
Explorer: https://xrpscan.com/ledger/51376176

1 example transaction from ledger: https://xrpl.org/data-api.html#transaction-objects
```
  %{
    "date" => "2019-11-13T20:50:10+00:00",
    "hash" => "EE3C84A606D90D480B61A6A2BE2E17AA520FC85FC5542C9B927258F47E8C3867",
    "ledger_index" => 51376176,
    "meta" => %{
      "AffectedNodes" => [
        %{
          "ModifiedNode" => %{
            "FinalFields" => %{
              "Account" => "rJb5KsHsDHF1YS5B5DU6QCkH5NsPaKQTcy",
              "Balance" => "35317571712440",
              "Flags" => 0,
              "OwnerCount" => 0,
              "Sequence" => 1932373
            },
            "LedgerEntryType" => "AccountRoot",
            "LedgerIndex" => "074B17A4119138EE9C46C3CF7EC7467C0D3E94EB71FE039ACC2CC02B2A6F42C6",
            "PreviousFields" => %{
              "Balance" => "35320006759470",
              "Sequence" => 1932372
            },
            "PreviousTxnID" => "78CB025ABE705BAFBC31183AAC50D1EB19921E7F365467A71BC9FA6D34B14D21",
            "PreviousTxnLgrSeq" => 51376151
          }
        },
        %{
          "ModifiedNode" => %{
            "FinalFields" => %{
              "Account" => "rLHzPsX6oXkzU2qL12kHCH8G8cnZv1rBJh",
              "Balance" => "490037388505626",
              "Flags" => 131072,
              "OwnerCount" => 2,
              "Sequence" => 488224
            },
            "LedgerEntryType" => "AccountRoot",
            "LedgerIndex" => "CFAFBE212FBA5490C7F0E2C8844200852C379ABFA389CC4C02BCD1ACA283742C",
            "PreviousFields" => %{"Balance" => "490034953658596"},
            "PreviousTxnID" => "B7FBFBFF5AD79BB814D61CD94F702922AA9BAB42609CDB5C38596DBB4C71974F",
            "PreviousTxnLgrSeq" => 51376132
          }
        }
      ],
      "TransactionIndex" => 0,
      "TransactionResult" => "tesSUCCESS",
      "delivered_amount" => "2434847030"
    },
    "tx" => %{
      "Account" => "rJb5KsHsDHF1YS5B5DU6QCkH5NsPaKQTcy",
      "Amount" => "2434847030",
      "Destination" => "rLHzPsX6oXkzU2qL12kHCH8G8cnZv1rBJh",
      "DestinationTag" => 3246974825,
      "Fee" => "200000",
      "Flags" => 2147483648,
      "LastLedgerSequence" => 51376204,
      "Sequence" => 1932372,
      "SigningPubKey" => "02C2EDA75565BA8D3CBD96FB28D53C9BE1B7A4DC1AF6FF1B2EBBD478D520BED52E",
      "TransactionType" => "Payment",
      "TxnSignature" => "3045022100D5A723CD1331522DA969631550731B34B86895658704C37AE841BA0DDEE8E4BF022007FDB28EC7237A6F1399F8C66DEC522D792E75056F9BDFB3D03E24429CA3891F"
    }
  }
```

Relevant data for transfer:
1. Unique transaction hash: `hash`
2. In ledger (block nr): `ledger_index`
3. It needs to be `Payment` type, location: `tx.TransactionType`
4. From address: `tx.Account`
5. To address: `tx.Destination`
6. Amount transferred (in drops, 1/1_000_000 XRP): `tx.Amount`, from example it's `2434847030 (drops) / 1_000_000 (drops/XRP) = 2_434.84703 XRP`

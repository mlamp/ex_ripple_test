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
    "hash" => "0D6B54FAD73D5F985484AB9CB819B1C7B18540B6A6E7A762EF321A32A99FD974",
    "ledger_index" => 51376176,
    "meta" => %{
      "AffectedNodes" => [
        %{
          "ModifiedNode" => %{
            "FinalFields" => %{
              "Account" => "rJb5KsHsDHF1YS5B5DU6QCkH5NsPaKQTcy",
              "Balance" => "35317034300440",
              "Flags" => 0,
              "OwnerCount" => 0,
              "Sequence" => 1932374
            },
            "LedgerEntryType" => "AccountRoot",
            "LedgerIndex" => "074B17A4119138EE9C46C3CF7EC7467C0D3E94EB71FE039ACC2CC02B2A6F42C6",
            "PreviousFields" => %{
              "Balance" => "35317571712440",
              "Sequence" => 1932373
            },
            "PreviousTxnID" => "EE3C84A606D90D480B61A6A2BE2E17AA520FC85FC5542C9B927258F47E8C3867",
            "PreviousTxnLgrSeq" => 51376176
          }
        },
        %{
          "ModifiedNode" => %{
            "FinalFields" => %{
              "Account" => "rUW9toSjQkLY6EspdnBJP2paG4hWKmNbMh",
              "Balance" => "1016342896820",
              "Flags" => 131072,
              "OwnerCount" => 0,
              "Sequence" => 1009
            },
            "LedgerEntryType" => "AccountRoot",
            "LedgerIndex" => "6CC8D1B4CD640D735C7EC805D8841386A65B7B565506001A5D3E6DF2AE6F3ADE",
            "PreviousFields" => %{"Balance" => "1015805684820"},
            "PreviousTxnID" => "CA01BDF49B90FBAA9DE45CF2BD6BB62F8AABA3120C7739E1C0058C754BEEEFD5",
            "PreviousTxnLgrSeq" => 51375937
          }
        }
      ],
      "TransactionIndex" => 1,
      "TransactionResult" => "tesSUCCESS",
      "delivered_amount" => "537212000"
    },
    "tx" => %{
      "Account" => "rJb5KsHsDHF1YS5B5DU6QCkH5NsPaKQTcy",
      "Amount" => "537212000",
      "Destination" => "rUW9toSjQkLY6EspdnBJP2paG4hWKmNbMh",
      "DestinationTag" => 1862585455,
      "Fee" => "200000",
      "Flags" => 2147483648,
      "LastLedgerSequence" => 51376204,
      "Sequence" => 1932373,
      "SigningPubKey" => "02C2EDA75565BA8D3CBD96FB28D53C9BE1B7A4DC1AF6FF1B2EBBD478D520BED52E",
      "TransactionType" => "Payment",
      "TxnSignature" => "3045022100C08B33029DC5239606C1AAB18809977B1970890A1B147C3089FEE7657F638154022060BBBA4E6A71E4E68F1F3C37F1C5A8E934F8E2559119227FDF723C6A8222F1F2"
    }
  },
```

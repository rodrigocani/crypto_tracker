# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CryptoTracker.Repo.insert!(%CryptoTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CryptoTracker.Repo
alias CryptoTracker.Cryptos.Crypto

# deletes all the previously added data (in case I run the mix command multiple time)
# Repo.delete_all(Crypto)

%Crypto{
  rank: "1",
  symbol: "BTC",
  name: "Bitcoin",
  price_usd: 6929.82,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "2",
  symbol: "ETH",
  name: "Ethereum",
  price_usd: 404.98,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "3",
  symbol: "XRP",
  name: "XRP",
  price_usd: 0.42,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "4",
  symbol: "BCH",
  name: "Bitcoin Cash",
  price_usd: 688.86,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "5",
  symbol: "EOS",
  name: "EOS",
  price_usd: 6.98,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "6",
  symbol: "XLM",
  name: "Stellar",
  price_usd: 0.23,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "7",
  symbol: "LTC",
  name: "Litecoin",
  price_usd: 73.35,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "8",
  symbol: "ADA",
  name: "Cardano",
  price_usd: 0.13,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "9",
  symbol: "USDT",
  name: "Tether",
  price_usd: 1.00,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "10",
  symbol: "MIOTA",
  name: "IOTA",
  price_usd: 0.86,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "11",
  symbol: "TRX",
  name: "TRON",
  price_usd: 0.03,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "12",
  symbol: "ETC",
  name: "Ethereum Classic",
  price_usd: 18.07,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "13",
  symbol: "XMR",
  name: "Monero",
  price_usd: 114.30,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "14",
  symbol: "NEO",
  name: "NEO",
  price_usd: 26.39,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "15",
  symbol: "DASH",
  name: "Dash",
  price_usd: 202.67,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "16",
  symbol: "BNB",
  name: "Binance Coin",
  price_usd: 13.67,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "17",
  symbol: "XEM",
  name: "NEM",
  price_usd: 0.14,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "18",
  symbol: "XTZ",
  name: "Tezos",
  price_usd: 1.84,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "19",
  symbol: "ZEC",
  name: "Zcash",
  price_usd: 178.20,
  active: false
}
|> Repo.insert!()

%Crypto{
  rank: "20",
  symbol: "OMG",
  name: "OmiseGO",
  price_usd: 5.27,
  active: false
}
|> Repo.insert!()

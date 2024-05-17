defmodule CryptoTracker.Cryptos.Crypto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "crypto" do
    field :rank, :string
    field :symbol, :string
    field :name, :string
    field :price_usd, :decimal
    timestamps()
  end

  @doc false
  def changeset(crypto, attrs) do
    crypto
    |> cast(attrs, [:rank, :symbol, :name, :price_usd])
    |> validate_required([:rank, :symbol, :name, :price_usd])
  end
end

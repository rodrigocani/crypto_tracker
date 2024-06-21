defmodule CryptoTracker.Cryptos.Crypto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "crypto" do
    field :rank, :string
    field :symbol, :string
    field :name, :string
    field :price_usd, :decimal
    field :active, :boolean
    timestamps()
  end

  @doc false
  def changeset(crypto, attrs) do
    crypto
    |> cast(attrs, [:rank, :symbol, :name, :price_usd, :active])
    |> validate_required([:rank, :symbol, :name, :price_usd, :active])
  end
end

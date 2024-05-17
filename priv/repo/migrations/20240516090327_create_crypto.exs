defmodule CryptoTracker.Repo.Migrations.CreateCrypto do
  use Ecto.Migration

  def change do
    create table(:crypto) do
      add :rank, :string
      add :symbol, :string
      add :name, :string
      add :price_usd, :decimal

      timestamps()
    end
  end
end

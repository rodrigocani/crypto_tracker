defmodule CryptoTracker.Cryptos do
  @moduledoc """
  The Cryptos context.
  """

  import Ecto.Query, warn: false
  alias CryptoTracker.Repo
  alias CryptoTracker.Cryptos.Crypto

  def subscribe do
    Phoenix.PubSub.subscribe(CryptoTracker.PubSub, "cryptos")
  end

  def broadcast(message) do
    Phoenix.PubSub.broadcast(CryptoTracker.PubSub, "cryptos", message)
  end

  @doc """
  Returns the list of active cryptos.
  """
  def list_active_cryptos do
    Repo.all(from c in Crypto, where: c.active == true)
  end

  @doc """
  Returns the list of inactive cryptos.
  """
  def list_inactive_cryptos do
    Repo.all(from c in Crypto, where: c.active == false)
  end

  @doc """
  Gets a single crypto by name or symbol.
  """
  def get_crypto_by_name_or_symbol(identifier) do
    Repo.one(from c in Crypto, where: c.name == ^identifier or c.symbol == ^identifier)
  end

  @doc """
  Gets a single crypto.

  Raises `Ecto.NoResultsError` if the Crypto does not exist.

  ## Examples

      iex> get_crypto!(123)
      %Crypto{}

      iex> get_crypto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crypto!(id), do: Repo.get!(Crypto, id)

  @doc """
  Creates a crypto.

  ## Examples

      iex> create_crypto(%{field: value})
      {:ok, %Crypto{}}

      iex> create_crypto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crypto(attrs \\ %{}) do
    %Crypto{}
    |> Crypto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a crypto.

  ## Examples

      iex> update_crypto(crypto, %{field: new_value})
      {:ok, %Crypto{}}

      iex> update_crypto(crypto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crypto(%Crypto{} = crypto, attrs) do
    crypto
    |> Crypto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a crypto.

  ## Examples

      iex> delete_crypto(crypto)
      {:ok, %Crypto{}}

      iex> delete_crypto(crypto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crypto(%Crypto{} = crypto) do
    Repo.delete(crypto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crypto changes.

  ## Examples

      iex> change_crypto(crypto)
      %Ecto.Changeset{data: %Crypto{}}

  """
  def change_crypto(%Crypto{} = crypto, attrs \\ %{}) do
    Crypto.changeset(crypto, attrs)
  end
end

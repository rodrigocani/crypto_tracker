defmodule CryptoTrackerWeb.CryptoTracker do
  use CryptoTrackerWeb, :live_view

  alias CryptoTracker.Cryptos
  alias CryptoTracker.Cryptos.Crypto
  alias CryptoTracker.Repo

  def mount(_params, _session, socket) do
    {:ok, assign(socket, cryptos: crypto_list())}
  end

  # Adds a crypto to the list
  def handle_event("add_crypto", %{"crypto" => crypto_name}, socket) do
    case update_crypto_active_status(crypto_name, true) do
      {:ok, _crypto} ->
        {:noreply, assign(socket, cryptos: crypto_list())}
    end
  end

  # Removes a crypto from the list
  def handle_event("remove_crypto", %{"symbol" => symbol}, socket) do
    case update_crypto_active_status_by_symbol(symbol, false) do
      {:ok, _crypto} ->
        {:noreply, assign(socket, cryptos: crypto_list())}
    end
  end

  # Returns all the crypto from the DB
  defp crypto_list do
    cryptos = Cryptos.list_cryptos()

    %{
      selected_cryptos: Enum.filter(cryptos, & &1.active),
      inactive_cryptos: Enum.filter(cryptos, &(!&1.active))
    }
  end

  defp update_crypto_active_status(crypto_name, status) do
    crypto = Cryptos.list_cryptos() |> Enum.find(&(&1.name == crypto_name))
    change_crypto_status(crypto, status)
  end

  defp update_crypto_active_status_by_symbol(symbol, status) do
    crypto = Cryptos.list_cryptos() |> Enum.find(&(&1.symbol == symbol))
    change_crypto_status(crypto, status)
  end

  defp change_crypto_status(%Crypto{} = crypto, status) do
    crypto
    |> Crypto.changeset(%{active: status})
    |> Repo.update()
  end
end

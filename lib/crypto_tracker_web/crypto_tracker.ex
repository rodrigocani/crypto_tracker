defmodule CryptoTrackerWeb.CryptoTracker do
  use CryptoTrackerWeb, :live_view

  alias CryptoTracker.Cryptos
  alias CryptoTracker.Repo
  alias CryptoTracker.Cryptos.Crypto

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Cryptos.subscribe()
    end

    {:ok, assign(socket, cryptos: crypto_list())}
  end

  # Adds a crypto to the list
  def handle_event("add_crypto", %{"crypto" => crypto_name}, socket) do
    update_crypto_active_status(crypto_name, true)
    {:noreply, assign(socket, cryptos: crypto_list())}
  end

  # Removes a crypto from the list
  def handle_event("remove_crypto", %{"symbol" => symbol}, socket) do
    update_crypto_active_status(symbol, false)
    {:noreply, assign(socket, cryptos: crypto_list())}
  end

  def handle_info(:crypto_updated, socket) do
    {:noreply, assign(socket, cryptos: crypto_list())}
  end

  # Returns all the crypto from the DB
  defp crypto_list do
    cryptos = Cryptos.list_cryptos()

    %{
      selected_cryptos: Enum.filter(cryptos, & &1.active),
      inactive_cryptos: Enum.filter(cryptos, &(!&1.active))
    }
  end

  # Updates the :active status of a crypto
  defp update_crypto_active_status(identifier, status) do
    Cryptos.list_cryptos()
    |> Enum.find(&(&1.name == identifier or &1.symbol == identifier))
    |> change_crypto_status(status)

    Cryptos.broadcast(:crypto_updated)
  end

  defp change_crypto_status(%Crypto{} = crypto, status) do
    crypto
    |> Crypto.changeset(%{active: status})
    |> Repo.update()
  end
end

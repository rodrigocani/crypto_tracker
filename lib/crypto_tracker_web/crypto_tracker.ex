defmodule CryptoTrackerWeb.CryptoTracker do
  use CryptoTrackerWeb, :live_view

  alias CryptoTracker.Cryptos
  alias CryptoTracker.Repo
  alias CryptoTracker.Cryptos.Crypto

  def mount(_params, _session, socket) do
    if connected?(socket) do
      Cryptos.subscribe()
    end

    cryptos = list_cryptos_by_status()

    {:ok,
     socket
     |> stream(:selected_cryptos, cryptos.selected_cryptos)
     |> stream(:inactive_cryptos, cryptos.inactive_cryptos)}
  end

  # Adds a crypto to the list
  def handle_event("add_crypto", %{"crypto" => crypto_name}, socket) do
    update_crypto_active_status(crypto_name, true)

    cryptos = list_cryptos_by_status()

    {:noreply,
     socket
     |> stream(:selected_cryptos, cryptos.selected_cryptos, reset: true)
     |> stream(:inactive_cryptos, cryptos.inactive_cryptos, reset: true)}
  end

  # Removes a crypto from the list
  def handle_event("remove_crypto", %{"symbol" => symbol}, socket) do
    update_crypto_active_status(symbol, false)

    cryptos = list_cryptos_by_status()

    {:noreply,
     socket
     |> stream(:selected_cryptos, cryptos.selected_cryptos, reset: true)
     |> stream(:inactive_cryptos, cryptos.inactive_cryptos, reset: true)}
  end

  def handle_info(:crypto_updated, socket) do
    cryptos = list_cryptos_by_status()

    {:noreply,
     socket
     |> stream(:selected_cryptos, cryptos.selected_cryptos, reset: true)
     |> stream(:inactive_cryptos, cryptos.inactive_cryptos, reset: true)}
  end

  defp list_cryptos_by_status do
    {selected_cryptos, inactive_cryptos} =
      Cryptos.list_cryptos()
      |> Enum.split_with(& &1.active)

    %{
      selected_cryptos: selected_cryptos,
      inactive_cryptos: Enum.sort_by(inactive_cryptos, & &1.name)
    }
  end

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

### gerador de autenticador do phoenix pra login e por usuario, nao global
### fly.io host
### filter through ecto db instead of returning db and then filtering

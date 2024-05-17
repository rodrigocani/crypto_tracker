defmodule CryptoTrackerWeb.CryptoTracker do
  use CryptoTrackerWeb, :live_view

  alias CryptoTracker.Cryptos

  def mount(_params, _session, socket) do
    cryptos = Cryptos.list_cryptos()
    {:ok, assign(socket, cryptos: cryptos, selected_cryptos: [])}
  end

  # Adds a new crypto to the left-container
  def handle_event("add_crypto", %{"crypto" => crypto_name}, socket) do
    selected_crypto =
      Enum.find(socket.assigns.cryptos, fn crypto -> crypto.name == crypto_name end)

    already_selected =
      Enum.any?(socket.assigns.selected_cryptos, fn crypto ->
        crypto.symbol == selected_crypto.symbol
      end)

    if !already_selected do
      new_selected_cryptos =
        socket.assigns.selected_cryptos ++
          [%{symbol: selected_crypto.symbol, price_usd: selected_crypto.price_usd}]

      {:noreply, assign(socket, selected_cryptos: new_selected_cryptos)}
    else
      {:noreply,
       socket
       |> put_flash(:error, "Cryptocurrency already added. Try a different one.")}
    end
  end

  # Removes a crypto from the list
  def handle_event("remove_crypto", %{"symbol" => symbol}, socket) do
    new_selected_cryptos =
      Enum.filter(socket.assigns.selected_cryptos, fn crypto ->
        crypto.symbol != symbol
      end)

    {:noreply, assign(socket, selected_cryptos: new_selected_cryptos)}
  end
end

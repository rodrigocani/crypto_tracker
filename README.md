# CryptoTracker

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## How it works

CryptoTracker is a Phoenix LiveView project for users to track the current value in Euros of selected cryptocurrencies.

On first loading, the project fetches a list of available cryptocurrencies and display them on a drop-down menu. NB. these values were hardcoded.

**Adding CryptoCurrencies**:
 * users can select a cryptocurrency from the dropdown and click on the button "Add".
 * add_crypto is triggered which adds the selected crypto to the left side container which shows the added currency.
 * If a crypto is already selected and displayed, it returns an error that this crypto is already on the list.
 * Users can remove the cryptocurrency from the displayed list

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

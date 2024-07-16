defmodule CryptoTrackerWeb.Redirect do
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, opts) do
    redirect(conn, to: opts[:to])
  end
end

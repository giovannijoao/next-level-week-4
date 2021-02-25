defmodule RocketpayWeb.AccountsController do
  use RocketpayWeb, :controller

  import Rocketpay, only: [deposit: 1]
  alias Rocketpay.Account

  action_fallback RocketpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- deposit(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
    end
  end
end

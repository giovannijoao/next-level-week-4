defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  import Rocketpay, only: [create_user: 1]
  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end

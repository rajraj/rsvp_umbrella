defmodule RsvpWeb.AuthorizedPlug do
  import Plug.Conn
  import Phoenix.Controller

  def init(opts) do
    opts
  end

  def call(conn, name) do
    username = conn.cookies["username"]
    authorize_user(conn, username, name)
  end

  defp authorize_user(conn, nil, _) do
    conn
    |> redirect(to: "/login")
    |> halt
  end

  defp authorize_user(conn, username, name) when username === name do
    conn
  end

  defp authorize_user(conn, _, _), do: authorize_user(conn, nil, nil)
end

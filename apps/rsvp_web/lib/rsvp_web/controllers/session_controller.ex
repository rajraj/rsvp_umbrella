defmodule RsvpWeb.SessionController do
  use RsvpWeb, :controller

  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => %{"username" => username}}) do
    expiration = 60 * 60 * 24 * 7

    conn
    |> Plug.Conn.put_resp_cookie("username", username, mag_age: expiration)
    |> redirect(to: "/events")
  end

end

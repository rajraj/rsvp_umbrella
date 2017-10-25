defmodule RsvpWeb.EventsController do
  use RsvpWeb, :controller

  plug RsvpWeb.AuthorizedPlug, "secret" when action in [:new, :create]

  def index(conn, _params) do
    events = Rsvp.EventQueries.find_all()
    render conn, "index.html", events: events
  end

  def show(conn, %{"id" => id}) do
    event = Rsvp.EventQueries.find_by_id(id)
    render conn, "show.html", event: event
  end

  def new(conn, %{errors: errors}) do
    render conn, "new.html", event: errors
  end

  def new(conn, _params) do
    event = Rsvp.Events.changeset(%Rsvp.Events{}, %{})
    render conn, "new.html", event: event
  end

  def create(conn, %{"events" => events}) do
    events = Map.update!(events, "start_at", fn d -> d <> ":00" end)
    event = Rsvp.Events.changeset(%Rsvp.Events{}, events)

    case Rsvp.EventQueries.create(event) do
      {:ok, %{id: id}} -> redirect conn, to: "/events/#{id}"
      {:error, reasons} -> new conn, %{errors: reasons}
    end
  end

  def reserve(conn, %{"id" => id, "reservation" => %{"quantity" => quantity}}) do
    {:ok, event} = Rsvp.EventQueries.reserve_seat(id, String.to_integer(quantity))
    redirect conn, to: "/events/#{event.id}"
  end
end

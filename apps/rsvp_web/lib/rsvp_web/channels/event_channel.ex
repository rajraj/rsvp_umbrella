defmodule RsvpWeb.EventChannel do
  use Phoenix.Channel

  def join("event:" <> event_id, _message, socket) when event_id <= 0 do
    {:error, %{reason: "Invalid event id"}}
  end

  def join("event:" <> event_id, _message, socket) do
    {:ok, socket}
  end

  def send_update(event) do
    available_seats = event.seats_available - event.seats_reserved
    payload = %{quantity: available_seats}

    broadcast!("event:#{event.id}", "update_seats_available", payload)
  end
end

defmodule RsvpWeb.EventsView do
  use RsvpWeb, :view

  def format_start_at(date) do
    {{year, month, day}, {hour, min, _}} = NaiveDateTime.to_erl(date)
    "#{day}/#{month}/#{year} at #{hour}:#{min}"
  end

  def available_seats(event) do
    event.seats_available - event.seats_reserved
  end
end

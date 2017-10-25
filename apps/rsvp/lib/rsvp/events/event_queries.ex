defmodule Rsvp.EventQueries do
  import Ecto.Query

  alias Rsvp.{Repo, Events}

  def any do
    Repo.one(from event in Events, select: count(event.id)) != 0
  end

  def find_all do
    Repo.all(from Events)
  end

  def find_by_location(location) do
    query = from event in Events,
      where: event.location == ^location

    Repo.all(query)
  end

  def find_by_id(id) do
    Repo.get(Events, id)
  end

  def create(event) do
    Repo.insert(event)
  end

  def reserve_seat(id, quantity) do
    event = Repo.get(Events, id)
    total_seats_reserved = event.seats_reserved + quantity
    changes = Ecto.Changeset.change(event, seats_reserved: total_seats_reserved)
    Repo.update(changes)
  end
end

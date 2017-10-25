# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rsvp.Repo.insert!(%Rsvp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

unless(Rsvp.EventQueries.any) do
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{title: "Ruby Talk", location: "London", start_at: "2017-10-30 10:00:00", seats_available: 10}))
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{title: "Elixir Talk", location: "Southampton", start_at: "2017-10-30 14:00:00", seats_available: 10}))
end

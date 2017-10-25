defmodule Rsvp.Repo.Migrations.AddSeatsInfoToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :seats_available, :integer, default: 0
      add :seats_reserved, :integer, default: 0
    end
  end
end

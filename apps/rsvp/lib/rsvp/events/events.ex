defmodule Rsvp.Events do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :description, :string
    field :location, :string
    field :start_at, :naive_datetime
    field :seats_available, :integer
    field :seats_reserved, :integer

    timestamps()
  end

  @required_fields ~w(title location start_at seats_available)a
  @optional_fields ~w(description seats_reserved)a

  def changeset(event, params \\ %{}) do
    event
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
    |> validate_change(:start_at, &must_be_in_future/2)
  end

  defp must_be_in_future(_, value) do
    value_to_ecto_time = value |> NaiveDateTime.to_erl |> Ecto.DateTime.from_erl
    Ecto.DateTime.compare(value_to_ecto_time, Ecto.DateTime.utc)
    |> get_error
  end

  defp get_error(comparison) when comparison == :lt, do: [start_at: "Cannot be in the past."]
  defp get_error(_), do: []
end

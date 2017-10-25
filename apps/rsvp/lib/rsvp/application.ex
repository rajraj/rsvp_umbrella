defmodule Rsvp.Application do
  @moduledoc """
  The Rsvp Application Service.

  The rsvp system business domain lives in this application.

  Exposes API to clients such as the `RsvpWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Rsvp.Repo, []),
    ], strategy: :one_for_one, name: Rsvp.Supervisor)
  end
end

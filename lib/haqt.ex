defmodule Haqt do
  use Application

  def start(type, args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Haqt.Web, []),
      worker(Haqt.Registration.GenServerStore, [[name: Registrations]])
    ]

    opts = [strategy: :one_for_one, name: Haqt.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

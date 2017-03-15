defmodule Haqt do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Haqt.Registration.HandlerSupervisor, []),
      worker(Haqt.Registration.Failover, []),
      supervisor(Haqt.Registration.Supervisor, []),
    ]

    opts = [strategy: :one_for_one, name: Haqt.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

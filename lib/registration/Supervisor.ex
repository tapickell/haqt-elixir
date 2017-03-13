defmodule Haqt.Registration.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Haqt.Web, []),
      worker(Haqt.Registration.Store, [[name: Registrations]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end

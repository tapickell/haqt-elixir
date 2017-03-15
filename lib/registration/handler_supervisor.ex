defmodule Haqt.Registration.HandlerSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    children = [
      worker(Haqt.Registration.Handler, [[name: Handler]])
    ]

    supervise(children, strategy: :one_for_one)
  end
end

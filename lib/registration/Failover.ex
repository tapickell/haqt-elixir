defmodule Haqt.Registration.Failover do

  def start_link do
    IO.puts "Failover start"
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def dump(state) do
    IO.puts "Failover dump #{inspect state}"
    Agent.cast(__MODULE__, fn(_) -> state end)
  end

  def load do
    IO.puts "Failover load"
    Agent.get(__MODULE__, fn(state) -> state end)
  end
end

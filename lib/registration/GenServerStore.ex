defmodule Haqt.Registration.GenServerStore do
  use GenServer

  def start_link(options \\ []) do
    GenServer.start_link(__MODULE__, [], options)
  end

  def register(server, registration) do
    GenServer.call(server, {:register, registration})
  end

  def unregister(server, registration) do
    GenServer.call(server, {:unregister, registration})
  end

  def registrations(server) do
    GenServer.call(server, {:registrations})
  end

  #server callbacks
  def init(_) do
    {:ok, []}
  end

  def handle_call({:registrations}, _from, state) do
    {:reply, {:ok, state}, state}
  end

  def handle_call({:register, registration}, _from, state) do
    case Enum.member?(state, registration) do
      true ->
        {:reply, {:ok, registration}, state}
      false ->
        {:reply, {:ok, registration}, [registration | state]}
    end
  end

  def handle_call({:unregister, registration}, _from, state) do
    case Enum.member?(state, registration) do
      true ->
        {:reply, {:ok, registration}, List.delete(state, registration)}
      false ->
        {:reply, {:ok, registration}, state}
    end
  end
end

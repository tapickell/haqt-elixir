defmodule Haqt.Registration.Handler do
  use GenServer
  alias Haqt.Registration.Actions

  def start_link(options \\ []) do
    IO.puts "Reg Handler Start Link"
    GenServer.start_link(__MODULE__, [], options)
  end

  def handle_event_type(registration) do
    handle_event_type(Handler, registration)
  end

  def handle_event_type(server, %{event_type: "attendee_count"}) do
    GenServer.call(server, {:attendee_count})
  end

  def handle_event_type(server, %{event_type: "speaker_count"}) do
    GenServer.call(server, {:speaker_count})
  end

  def handle_event_type(server, %{event_type: "total_count"}) do
    GenServer.call(server, {:total_count})
  end

  def handle_event_type(server, %{event_type: "register"} = event) do
    GenServer.cast(server, {:register, event.registration})
    {:rcvd, "Thank you"}
  end

  def handle_event_type(server, %{event_type: "unregister"} = event) do
    GenServer.cast(server, {:unregister, event.registration})
    {:rcvd, "Thank you"}
  end

  def handle_event_type(_server, %{event_type: _}) do
    {:error, "Nope"}
  end

  #server callbacks
  def init(_) do
    {:ok, %{}}
  end

  def handle_call({:attendee_count}, _from, state) do
    {:reply, {:ok, Actions.count_attendees}, state}
  end

  def handle_call({:speaker_count}, _from, state) do
    {:reply, {:ok, Actions.count_speakers}, state}
  end

  def handle_call({:total_count}, _from, state) do
    {:reply, {:ok, Actions.count_total}, state}
  end

  def handle_cast({:register, registration}, state) do
    Actions.register(registration)
    {:noreply, state}
  end

  def handle_cast({:unregister, registration}, state) do
    Actions.unregister(registration)
    {:noreply, state}
  end
end

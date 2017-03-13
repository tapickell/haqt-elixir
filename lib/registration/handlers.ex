defmodule Haqt.Registration.Handler do
  alias Haqt.Registration.Actions

  def handle_event_type(event) do
    case event do
      %{event_type: "attendee_count"} ->
        Actions.count_attendees
      %{event_type: "speaker_count"} ->
        Actions.count_speakers
      %{event_type: "total_count"} ->
        Actions.count_total
      %{event_type: "register"} ->
        Actions.register(event.registration)
      %{event_type: "unregister"} ->
        Actions.unregister(event.registration)
      %{event_type: _} ->
        {:error, "Nope"}
    end
  end
end

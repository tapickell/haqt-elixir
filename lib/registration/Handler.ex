defmodule Haqt.Registration.Handler do
  alias Haqt.Registration.Actions

  def handle_event_type(event) do
    case event do
      %{"eventType" => "attendee_count"} ->
        Actions.count_attendees
      %{"eventType" => "speaker_count"} ->
        Actions.count_speakers
      %{"eventType" => "total_count"} ->
        Actions.count_total
      %{"eventType" => "register"} ->
        Actions.register(event.registration)
      %{"eventType" => "unregister"} ->
        Actions.unregister(event.registration)
      %{"eventType" => _} ->
        {:error, "Nope"}
    end
  end
end

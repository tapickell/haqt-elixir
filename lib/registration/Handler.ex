defmodule Haqt.Registration.Handler do
  def handle_event_type(event) do
    case event do
      %{"eventType" => "attendee_count"} ->
        Haqt.Registration.Actions.count_attendees
      %{"eventType" => "speaker_count"} ->
        Haqt.Registration.Actions.count_speakers
      %{"eventType" => "total_count"} ->
        Haqt.Registration.Actions.count_total
      %{"eventType" => _} ->
        {:error, "Nope"}
    end
  end
end

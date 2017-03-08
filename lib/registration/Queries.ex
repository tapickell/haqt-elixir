defmodule Haqt.Registration.Queries do
  def number_of_attendees do
    24
  end

  def number_of_speakers do
    9
  end

  def number_of_registrations do
    24 + 9
  end

  defp registrations do
    [
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "speaker", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "speaker", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "speaker", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "speaker", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"},
      %{registration_type: "attendee", name: "Bob"}
    ]
  end
end

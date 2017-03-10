defmodule Haqt.Registration.Queries do
  def number_of_attendees do
    registrations
    |> Enum.filter(fn(reg) -> reg.registration_type == "attendee" end)
    |> Enum.count
  end

  def number_of_speakers do
    registrations
    |> Enum.filter(fn(reg) -> reg.registration_type == "speaker" end)
    |> Enum.count
  end

  def number_of_registrations do
    registrations
    |> Enum.count
  end

  defp registrations do
    Haqt.Registration.GenServerStore.registrations(Registrations)
  end
end

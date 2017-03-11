defmodule Haqt.Registration.Queries do
  alias Haqt.Registration.GenServerStore

  # error handle around type key
  def number_of_attendees do
    registrations()
    |> Enum.filter(fn(reg) -> reg.type == "attendee" end)
    |> Enum.count
  end

  def number_of_speakers do
    registrations()
    |> Enum.filter(fn(reg) -> reg.type == "speaker" end)
    |> Enum.count
  end

  def number_of_registrations do
    registrations()
    |> Enum.count
  end

  def register(registration) do
    GenServerStore.register(Registrations, registration)
  end

  def unregister(registration) do
    GenServerStore.unregister(Registrations, registration)
  end

  defp registrations do
    {:ok, registrations} = GenServerStore.registrations(Registrations)
    registrations
  end
end

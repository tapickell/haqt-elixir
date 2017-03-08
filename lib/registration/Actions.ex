defmodule Haqt.Registration.Actions do

  def count_attendees do
    {:ok, "#{Haqt.Registration.Queries.number_of_attendees}"}
  end

  def count_speakers do
    {:ok, "#{Haqt.Registration.Queries.number_of_speakers}"}
  end

  def count_total do
    {:ok, "#{Haqt.Registration.Queries.number_of_registrations}"}
  end
end

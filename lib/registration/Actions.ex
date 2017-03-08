defmodule Haqt.Registration.Actions do

  def count_attendees do
    try_query &Haqt.Registration.Queries.number_of_attendees/0
  end

  def count_speakers do
    try_query &Haqt.Registration.Queries.number_of_speakers/0
  end

  def count_total do
    try_query &Haqt.Registration.Queries.number_of_registrations/0
  end

  defp try_query(query) do
    try do
      number = query.()
      {:ok, Integer.to_string(number)}
    rescue
      _ -> {:error, "Nada"}
    end
  end
end

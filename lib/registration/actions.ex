defmodule Haqt.Registration.Actions do
  alias Haqt.Registration.Queries
  alias Haqt.Registration.Validations

  def count_attendees do
    try_cast_count &Queries.number_of_attendees/0
  end

  def count_speakers do
    try_cast_count &Queries.number_of_speakers/0
  end

  def count_total do
    try_cast_count &Queries.number_of_registrations/0
  end

  def register(registration) do
    on_validation(registration, &Queries.register/1)
  end

  def unregister(registration) do
    on_validation(registration, &Queries.unregister/1)
  end

  defp on_validation(registration, query) do
    case Validations.validate_registration(registration) do
      {:ok, valid_registration} ->
        query.(valid_registration)
      {:error, message} ->
        {:error, message}
    end
  end

  defp try_cast_count(query) do
    try do
      number = query.()
      {:ok, Integer.to_string(number)}
    rescue
      _ -> {:error, "Nada"}
    end
  end
end

defmodule Haqt.Registration.Validations do
  def validate_registration(%{type: type, name: name}) do
    {:ok, %Haqt.Registration.Struct{type: type, name: name}}
  end

  def validate_registration(_) do
    {:error, "Invalid Registration"}
  end
end

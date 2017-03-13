defmodule Haqt.Registration.Validations do
  alias Haqt.Registration.Struct

  def validate_registration(%{type: type, name: name}) do
    {:ok, %Struct{type: type, name: name}}
  end

  def validate_registration(_) do
    {:error, "Invalid Registration"}
  end
end

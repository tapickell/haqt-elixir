defmodule Haqt.Registration.Struct do
  @enforce_keys [:type, :name]
  defstruct [:type, :name]
end

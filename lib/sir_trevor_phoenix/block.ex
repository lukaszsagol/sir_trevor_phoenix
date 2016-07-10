defmodule SirTrevorPhoenix.Block do
  @derive [Poison.Encoder]
  defstruct [:type, :data]
end

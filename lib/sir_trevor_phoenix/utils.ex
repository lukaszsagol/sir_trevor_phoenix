defmodule SirTrevorPhoenix.Utils do

  def first_block_of_type([], _), do: nil
  def first_block_of_type(blocks, type) do
    Enum.find(blocks, &by_type(&1, type))
  end


  def has_block_of_type?([], _), do: false
  def has_block_of_type?(blocks, type) do
    Enum.any?(blocks, &by_type(&1, type))
  end

  defp by_type(block, type) do
    block.type == type
  end
end

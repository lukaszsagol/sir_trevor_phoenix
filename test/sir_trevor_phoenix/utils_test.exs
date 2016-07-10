defmodule SirTrevorPhoenix.UtilsTest do
  use ExUnit.Case
  doctest SirTrevorPhoenix.Utils
  alias SirTrevorPhoenix.{Block, Utils}

  test "#has_block_of_type? returns true if found matching block" do
    blocks = [%Block{type: "text", data: "Text Block 1"}]

    assert Utils.has_block_of_type?(blocks, "text")
  end

  test "#has_block_of_type? returns false if no matching block" do
    blocks = [%Block{type: "image", data: "Image Block"}]

    refute Utils.has_block_of_type?(blocks, "text")
  end

  test "#has_block_of_type? returns false if no blocks" do
    blocks = []

    refute Utils.has_block_of_type?(blocks, "text")
  end

  test "#first_block_of_type returns block if found matching" do
    first_block = %Block{type: "text", data: "Text Block"}
    blocks = [first_block]

    assert Utils.first_block_of_type(blocks, "text") == first_block
  end

  test "#first_block_of_type ignores blocks of different type" do
    first_block = %Block{type: "image", data: "Image Block"}
    second_block = %Block{type: "text", data: "Text Block"}
    blocks = [first_block, second_block]

    assert Utils.first_block_of_type(blocks, "text") == second_block
  end

  test "#first_block_of_type returns first block if multiple matching" do
    first_block = %Block{type: "text", data: "Text Block 1"}
    second_block = %Block{type: "text", data: "Text Block 2"}
    blocks = [first_block, second_block]

    assert Utils.first_block_of_type(blocks, "text") == first_block
    refute Utils.first_block_of_type(blocks, "text") == second_block
  end

  test "#first_block_of_type returns nil if none matching" do
    first_block = %Block{type: "image", data: "Image Block"}
    blocks = [first_block]

    assert Utils.first_block_of_type(blocks, "text") == nil
  end

  test "#first_block_of_type returns nil if no blocks" do
    blocks = []

    assert Utils.first_block_of_type(blocks, "text") == nil
  end
end

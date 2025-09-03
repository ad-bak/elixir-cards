defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 16 cards" do
    deck = Cards.create_deck()
    assert length(deck) == 16
  end

  test "shuffling a deck randomizes it" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end

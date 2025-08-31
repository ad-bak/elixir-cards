defmodule Cards do
  def create_deck do
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Jack", "Queen", "King"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle (deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    {hand, remaining_deck} = Enum.split(deck, hand_size)
    {hand, remaining_deck}
  end

end

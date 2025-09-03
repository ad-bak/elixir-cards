defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  def create_deck do
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    values = ["Ace", "Jack", "Queen", "King"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
  Shuffles the deck of cards.
  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.shuffle(deck) != deck
      true
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Checks if a card is in the deck.

  ## Examples
      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    {hand, remaining_deck} = Enum.split(deck, hand_size)
    {hand, remaining_deck}
  end

  @doc """
    Saves the deck to a file.

  ## Example
      iex> deck = Cards.create_deck()
      iex> Cards.save(deck, "my_deck")
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "#{reason}"
    end
  end

  def create_hand(hand_size) do
    create_deck() |> shuffle() |> deal(hand_size)
  end
end

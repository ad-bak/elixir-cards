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



  # def save(deck,filename)  do
  #   # binary = :erlang.term_to_binary(deck)
  #   # File.write(filename, binary)

  #   # convert to txt  instead
  #   # File.write(filename <> ".txt", Enum.join(deck, "\n"))
  #   # same function but here we check if file name contains .txt extension
  #   if String.ends_with?(filename, ".txt") do
  #     File.write(filename, Enum.join(deck, "\n"))
  #   else
  #     File.write(filename <> ".txt", Enum.join(deck, "\n"))
  #   end
  # end
  #
  def save(deck, filename) do
    File.write((if String.ends_with?(filename, ".txt"), do: filename, else: filename <> ".txt"), Enum.join(deck, "\n"))
  end


end

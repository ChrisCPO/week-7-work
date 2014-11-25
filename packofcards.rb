class Card
  attr_reader :rank, :suit
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def show
    puts @suit + @rank.to_s
  end
end

class Deck
  attr_reader :cards
  def build
    @cards = []
    ranks = %w(1 2 3 4 5 6 7 8 9 10 11 12 13)
    suits = %w(S H D C)

    suits.each do |suit|
      ranks.each do |rank|
        cards << Card.new(suit,rank.to_i)
      end
    end
  end

  def show
    cards.each do |card|
      card.show
    end
  end

  def shuffle
    cards.shuffle!
  end
end

require_relative "packofcards.rb"

class PokerGame
  attr_reader :number_of_players
  def initialize(number_of_players)
    @number_of_players = number_of_players
  end

  def play
    deal_cards
  end

  def deal_cards
    dealer = Dealer.new(Deck.new)
   dealer.deal(number_of_players)
  end
end


class Dealer
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    deck.build
    deck.shuffle
  end

  def deal(players)
    deck.cards.each do |card|
      print card.show
    end
  end
end

game = PokerGame.new(4)
game.play

require_relative "packofcards.rb"
require_relative "player.rb"
require_relative "dealer.rb"

class PokerGame
  attr_reader :number_of_players
  attr_accessor :players
  def initialize(number_of_players=4)
    @number_of_players = number_of_players
    @players = Array.new
  end

  def play
    create_players
    players = deal_cards
    determine_hand = HandCaculator.new(players)
    determine_hand.show
  end

  def deal_cards
    dealer = Dealer.new(Deck.new)
    dealer.deal(players)
  end

  def create_players
    number_of_players.times  { |index| players << Player.new(index) }
  end
end


class HandCaculator
  attr_reader :players
  def initialize(players)
    @players = players
  end

  def start
    players.each |player|
    if player.cards == OnePair.new(player)
    end
  end
end

class OnePair
  attr_reader :deck
  def initialize(player)
    @cards = player.cards
    figure
    @deck = Deck.new
  end

  def figure
    cards.each do |card|
      card.rank
  end
end



game = PokerGame.new(4)
game.play

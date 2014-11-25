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
    determine_hand.start
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
    players.each do |player|
      player.show_cards
      # if player.cards == OnePair.new(player)
      # end
    end
  end
end

class OnePair
  # i dont know what do to i have an array of cards per player but i cant call
  # .uniq on cards.uniq .rank
  attr_reader :cards, cards_ranks
  def initialize(player)
    @cards = player.cards
    list_ranks
    determine
  end

  def list_ranks
    cards_ranks = []
    cards.each {|card| card.rank}
  end

  def determine
    results = cards.uniq
    puts results
  end
end



game = PokerGame.new(4)
game.play

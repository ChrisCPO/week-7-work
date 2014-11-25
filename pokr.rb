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
    reveal_hands
  end

  def deal_cards
    dealer = Dealer.new(Deck.new)
    dealer.deal(players)
  end

  def create_players
    number_of_players.times  { |index| players << Player.new(index) }
  end

  def reveal_hands
    players.each  { |player| puts player.show_hand }
  end
end

class HandCaculator
  attr_reader :players
  def initialize(players)
    @players = players
  end

  def start
    players.each do |player|
      Flush.new(player)
    end
  end
end

class Flush
  attr_reader :cards, :player, :results
  def initialize(player)
    @player = player
    @cards = player.cards
    @results = []
    determine
  end

  def determine
    cards.each { |card| results << card.suit }
    results.uniq!
    if results.length == 1
      player.hand = "Flush"
    end
  end
end

class OnePair
  attr_reader :cards
  def initialize(player)
    @cards = player.cards
    list_ranks
    determine
  end

  def determine
    results = cards.uniq
    puts results
  end
end



game = PokerGame.new(4)
game.play

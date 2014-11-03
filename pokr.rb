class Deck
  attr_reader :deck

  def initialize
    @deck = []
    build
  end

  def build 
    base = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    suits = %w(Spades Hearts Clubs Diamonds)
    suits.each do |suit|
      base.each do |card|
       @deck << (card + " " + suit) 
      end
    end
  end
end

class Game
  attr_reader :players
  def initialize(number_of_players=4)
    @players = []
    @deck = Deck.new.deck.shuffle

    build_player_list(number_of_players)
  end

  def build_player_list(number_of_players)
    hand = []
    number_of_players.times do |num|
      hand = @deck.take(5)
      @players << Player.new("player" + num.to_s, hand)
    end
  end
end


class Player
  attr_reader :hand, :name
  def initialize(name, hand)
    @hand = hand
    @name = name
  end
end

pokr = Game.new
#puts pokr.players
pokr.players.each do |player|
  puts ""
  puts player.name
  puts player.hand
end











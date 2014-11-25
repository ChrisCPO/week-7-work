class Player
  attr_reader :name
  attr_accessor :cards, :hand
  def initialize(index)
    @cards = Array.new
    @name = give_player_name(index)
    @hand = ""
  end

  def show_cards
    cards.each do |card|
      card.to_s
    end
  end

  def show_hand
    puts name
    show_cards
    puts hand
  end

  private

  def give_player_name(index)
    index = index + 1
    index = "player" + index.to_s
  end
end

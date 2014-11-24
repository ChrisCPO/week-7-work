class Player
  attr_reader :name
  attr_accessor :cards
  def initialize(index)
    @cards = Array.new
    @name = give_player_name(index)
  end

  def show_cards
    cards.each do |card|
      card.show
    end
  end

  private

  def give_player_name(index)
    index = index + 1
    index = "player" + index.to_s
  end
end

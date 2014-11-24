class Dealer
  attr_reader :deck
  def initialize(deck)
    @deck = deck
    deck.build
    deck.shuffle
  end

  def deal(players)
      5.times do
        players.each do |player|
          player.cards << deck.cards.pop
      end
    end
      players
  end
end

class Hand
  attr_reader :positions
  def initialize
    @positions = %w(rock paper scissors)
  end
end

class Game
  
end

class ActorController
  attr_accessor :win, :score, :cheating
  attr_reader :choice
  def initialize
    @cheating = false
    @score = 0
    @choice = ""
  end

  def win
    @score =+ 1
    #puts "#{self.class}  wins"
  end
end

class PlayerController < ActorController
  def initialize(game)
    super()
    @game = game
  end

  def choose_hand
    puts "choose your hand"
    puts "r/p/s or q to quit"
    answer = gets.chomp.to_s
      if answer == "r"
        @choice = "rock"
      elsif answer == "p"
        @choice = "paper"
      elsif answer == "s"
        @choice = "scissors"
      elsif answer == "q"
        @game.show_scores
      end
    puts "your choice was #{choice}"
  end
end 

class AiController < ActorController
  def choose_hand
    @choice = Hand.new.positions[rand(0..2)]
    puts "the bot choose #{choice}"
  end
end

class Round
  attr_reader :player, :bot
  def initialize(player,bot)
    @player = player
    @bot = bot 
  end
  
  def start
    choose_hand
  end

  def choose_hand
    player.choose_hand
    bot.choose_hand
  end

  def determine_victor
     puts player.choice
     puts bot.choice
    if player.choice == "rock" && bot.choice == "scissors"
      player.win 
    elsif player.choice == "scissors" && bot.choice == "paper"
      player.win
    elsif player.choice == "paper" && bot.choice == "rock"
      player.win
    elsif player.choice == bot.choice
      puts "was a tie"
    else 
      bot.win
    end 
  end
end

class Game
  attr_reader :player, :bot
  def initialize
    @player = PlayerController.new(self)
    @bot = AiController.new
  end
  
  def start 
    @round = Round.new(@player, @bot)
    @round.start
    @round.determine_victor
  end

  def show_scores
      puts player.score.class
       puts "player points #{player.score}"
       puts "bot points #{bot.score}"
       puts "---------------------"
     if player.cheating == true || bot.cheating == true
       #then cheating player wins 
     elsif player.score > bot.score
       puts "player wins #{player.score}"
     elsif player.score < bot.score
       puts "bot wins #{bot.score}"
     elsif player.score == bot.score
       puts "game was a tie"
     else
     end
  end
end

game = Game.new
game.start
game.show_scores



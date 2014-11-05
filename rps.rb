class Hand
  attr_reader :positions
  def initialize
    @positions = %w(rock paper scissors)
  end
end

class Game
  
end

class ActorController
  attr_accessor :win, :score
  attr_reader :choice
  def initialize
    @score = 0
    @choice = ""
  end

  def win
    puts "#{self.class}  wins"
    @score =+ 1
  end
end

class PlayerController < ActorController
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
  def initialize
    @player = PlayerController.new
    @bot = AiController.new
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
     puts player.score
     puts bot.score
  end
end


testround = Round.new
testround.start
testround.determine_victor




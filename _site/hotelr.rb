require 'csv'
require './hotel.rb'

class Main
  attr_reader :hotels_list
  def initialize
    @hotels_list = []
    CSV.foreach("hotels.csv", headers: true) do |info|
      hotels_list << Hotel.new(info)
    end
  end

  def start 
    puts hotels_list
    print "enter a hotel >"
    query = gets.chomp
    selected_hotel = hotels_list.find {|hotel| hotel.name == query}

    puts selected_hotel.info
  end
end

hotels_db = Main.new
hotels_db.start

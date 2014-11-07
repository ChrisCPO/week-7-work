require 'csv'
require './hotel.rb'

class Main
  attr_reader :hotels_list, :selected_hotel
  def initialize
    @hotels_list = []
    CSV.foreach("hotels.csv", headers: true) do |info|
      hotels_list << Hotel.new(info)
    end
  end

  def start 
    prompt_user
    display_info
  end

  def prompt_user
    puts hotels_list
    print "enter a hotel >"
    find_hotel(gets.chomp)
  end

  def find_hotel(query)
    @selected_hotel = hotels_list.find{|hotel| hotel.name == query ||= NullHotel.new }
  end

  def display_info
    puts "-" * 10
    puts selected_hotel.info
  end
end

hotels_db = Main.new
hotels_db.start

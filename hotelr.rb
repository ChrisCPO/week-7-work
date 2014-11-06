require 'csv'
require './hotel.rb'

class Main
  attr_accessor :hotel_collection
  attr_reader :search_headers
  def initialize
    hotels = CSV.read("hotels.csv")

    @search_headers = hotels.shift

    @hotel_collection = hotels.map.with_index do |info,index|
      Hotel.new(hotels[index])
    end

  end
  
  def search
    puts "search by"
    @search_headers.each do |title|
      print title + " | " 
    end
    puts "enter seach query >"
    @query = gets.chomp
    review
  end

  def review
    hotel_collection.each do |info|
      match?(info)
    end
  end

  def match?(info)
    @query == info
    
  end
end





hotelsdb = Main.new
hotelsdb.search

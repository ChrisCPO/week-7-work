require 'csv'


class Main
  def initialize
    hotels = CSV.read("hotels.csv")
    puts hotels.size
    search_headers = hotels.shift

    @hotel_collection = []
    hotels.map.with_index do |info,index| index = +1
      @hotel_collection << Hotel.new(hotels[index])
    end

    puts @hotel_collection.inspect
  end

end



class Hotel
  attr_reader :properties
  def initialize(properties)
    @properties = properties
  end
end


hotelsdb = Main.new

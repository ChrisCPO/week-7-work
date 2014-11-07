class Hotel
  attr_reader(:name,
              :location,
              :phone_number,
              :single_rooms,
              :double_rooms
               )
  def initialize(info)
    @name = info["Hotel"].strip
    @location = info["City"].strip
    @phone_number = info["Phone Number"]
    @single_rooms = info["Number of Singles"].strip.gsub(",","").to_i
    @double_rooms = info["Number of Doubles"].strip.gsub(",","").to_i
  end

  def to_s
    name
  end

  def info
    info = [location,phone_number,total_rooms]
    puts info
  end

  def total_rooms
    single_rooms + double_rooms
  end
end

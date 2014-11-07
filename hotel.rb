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
    @phone_number = phone_number_format(info["Phone Number"])
    @single_rooms = clean_number(info["Number of Singles"])
    @double_rooms = clean_number(info["Number of Doubles"])
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

  def phone_number_format(number)
    number = clean_number(number).to_s
    number.insert(3,"-").insert(7,"-")
  end

  def clean_number(number)
    number.strip.gsub(/[^\d+]/, "").strip.to_i
  end
end

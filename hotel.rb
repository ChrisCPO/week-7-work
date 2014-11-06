class Hotel
  attr_reader :properties
  attr_accessor :name, :city, :phone_number, :single_rooms, :double_rooms
  def initialize(properties)
    @properties = properties
    create
  end

  def create
    self.name = properties[0]
    self.city = properties[1]
    self.phone_number = properties[2]
    self.single_rooms = properties[3]
    self.double_rooms = properties[4]
  end
end

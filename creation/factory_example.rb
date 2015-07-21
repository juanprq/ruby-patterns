class Vehicle
  attr_reader :wheels

  # Definition of class methods
  class << self
    private :new
    def truck
      new 18
    end

    def car
      new 4
    end

    def motorcycle
      new 2
    end
  end

  def initialize(wheels)
    @wheels = wheels
  end
end

# i need a motorcycle
motorcycle = Vehicle.motorcycle

puts "how many wheels have my motorcycle? '#{motorcycle.wheels}'"

# i can't create a custom vehicle, throws exception
custom_car = Vehicle.new 7
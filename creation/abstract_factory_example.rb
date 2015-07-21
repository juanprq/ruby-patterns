# Kia brand module
module Kia
  # class methods definition
  extend self

  def store
    Store.new
  end

  # Store class definition
  class Store
    def buy_car
      puts "you bought a kia cerato"
    end
  end

end

# Renault brand model
module Renault
  extend self

  def store
    Store.new
  end

  # Store class definition
  class Store
    def buy_car
      puts "you bought a renault koleos"
    end
  end
end

# Example using an Application class
class Application
  def initialize(brand)
    # buy a car
    store = brand.store
    store.buy_car
    puts "wohoo!"
  end
end

# Check if is a kia or renault store.
# Run as ruby abstract_factory_example.rb "kia"
if ARGV[0] == 'kia'
  application = Application.new Kia
else
  application = Application.new Renault
end
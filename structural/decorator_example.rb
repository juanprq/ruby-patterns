class Coffee
  def cost
    2
  end

  def origin
    "Colombia"
  end

  def color
    "Black"
  end
end

class Milk
  def initialize(component)
    @component = component
  end

  def cost
    @component.cost + 0.4
  end

  def color
    if @component.is_a? Coffee
      "brown"
    else
      "white"
    end
  end
end

puts "lets drink coffee!"
coffee = Coffee.new
puts "my coffee is: #{coffee.color}"
puts "lets add some milk"
coffee_with_milk = Milk.new coffee
puts "how much it cost? #{coffee_with_milk.cost}"
puts "and the color now? #{coffee_with_milk.color}"
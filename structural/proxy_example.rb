class HasManyAssociation < BasicObject
  attr_accessor :associated_class

  def initialize(array)
    @array = array
  end

  def create(params)
    self << associated_class.new(params)
  end

  def method_missing(*a, &b)
    @array.send(*a, &b)
  end
end

class User
  attr_accessor :name

  def initialize(params)
    @name = params[:name]
  end
end

puts "let's create objects!"

association = HasManyAssociation.new []
association.associated_class = User
association.create({name: "foo"})
association.create({name: "bar"})

# lets test the proxy/delegate
puts association.size
association.each do |user|
  puts user.name
end
class Dependency
  # Class methos definition
  class << self
    def instances
      @instances ||= {}
    end

    def [](name)
      instances[name] ||= new(name)
    end
  end

  # Initialization of the instance
  def initialize(name)
    puts "Dependency: '#{name}' created!"
  end

end

# if a dependency doesn't exist create (lazy initialization)
management = Dependency['management']

# if other dependency it's needed
sales = Dependency['sales']

# check if the management dependency instance
puts "management same instance? #{management == Dependency['management']}"
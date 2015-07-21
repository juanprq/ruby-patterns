require 'singleton'

class Configuration
  # Ruby common module to implement the singleton pattern
  include Object::Singleton

  def initialize
    # This method only gets called 1 time.
    puts ""
    @params = {}
  end

  def set_param(key, value)
    @params[key] = value
  end

  def get_param(key)
    @params[key]
  end

end

# lazy initialization
config = Configuration.instance
# gets always the same instance
new_config = Configuration.instance
puts "same instance?: #{config == new_config}"

# modify 1 value
config.set_param :test, "foo"

# it gets modified in 2
puts "value of :test in new_config: #{new_config.get_param(:test)}"

# error if we try to created a new instance
Configuration.new
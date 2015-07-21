module Marky
  extend self

  def adapter
    return @adapter if @adapter
    self.adapter = :rdiscount
    @adapter
  end

  def adapter=(adapter_name)
    case adapter_name
    when Symbol, String
      require_relative "adapters/#{adapter_name}"
      @adapter = Marky::Adapters.const_get("#{adapter_name.to_s.capitalize}")
    else
      raise "Missing adapter #{adapter_name}"
    end
  end

  def to_html(string)
    adapter.to_html(string)
  end
end

# using RDiscount as a backend
Marky.adapter = :rdiscount

puts Marky.to_html("hello world") #=> "<p>hello world</p>

# using BlueCloth as a backend
Marky.adapter = :bluecloth

puts Marky.to_html("hello world") #=> "<p>hello world</p>"
require "rdiscount"

module Marky
  module Adapters
    module Rdiscount
      extend self
      def to_html(string)
        ::RDiscount.new(string).to_html
      end
    end
  end
end
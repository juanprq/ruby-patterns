require "bluecloth"

module Marky
  module Adapters
    module Bluecloth
      extend self
      def to_html(string)
        ::BlueCloth.new(string).to_html
      end
    end
  end
end
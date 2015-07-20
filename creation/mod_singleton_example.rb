module Configuration
  # extend the module to add functions
  extend self

    def set_param(key, value)
      params[key] = value
    end

    def get_param(key)
      params[key]
    end

    private

      # lazy initialization for the hash
      def params
        @params ||= {}
      end

end

# with this approach you can simply call the same instande using the module

Configuration.set_param :test, "foo"
puts "value of :test in new_config: #{Configuration.get_param(:test)}"

# error if we try to created a new instance
Configuration.new
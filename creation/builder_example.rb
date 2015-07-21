class Formatter
  # Class methods definition
  class << self
    def formats
      @formats ||= {}
    end

    def format(name, options = {}, &block)
      formats[name] = Class.new(Format, &block)
    end

    def render(format, params = {})
      format_obj = formats[format].new
      format_obj.params = params
      format_obj.render
    end
  end
end

class Format
  attr_accessor :params
end

class ListFormatter < Formatter
  format :text do
    def render
      params[:data].map { |e| "* #{e}" }.join("\n")
    end
  end

  format :html do
    def render
      list_elements = params[:data].map { |e| "<li>#{e}</li>" }.join
      "<ul>#{list_elements}</ul>"
    end
  end
end

data = ['foo', 'bar', 'hi!']
[:html, :text].each do |format|
  puts ListFormatter.render(format, data: data)
end
require "open-uri"
require 'net/http'
require 'uri'

# Normally you have to
url = URI.parse('http://getbootstrap.com/')

res = Net::HTTP.start(url.host, url.port) {|http|
  http.get('/')
}

puts res.body

# Simplifies the code above to only one line
puts open("http://www.google.com").read

# Implementation of a facade similar to open-uri
module HttpClient
  extend self

  def get(url)
    url = URI.parse(url)

    res = Net::HTTP.start(url.host, url.port) {|http|
      http.get('/')
    }

    res.body
  end
end

# Let's use the facade
puts HttpClient.get('http://getbootstrap.com/')
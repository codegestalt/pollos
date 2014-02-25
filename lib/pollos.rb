require 'open-uri'

module Pollos
  # Public: Starts a new listener
  #
  # integer - Interval in seconds
  # api_get_endpoint - URL from where pollos gets the app hash
  # api_post_endpoint - URL where pollos sends the response back 
  #
  # Returns: A new Listener Object
  #
  class Listener
    def initialize(interval, api_get_endpoint, api_post_endpoint)
      @interval = interval
      @api_get_endpoint = api_get_endpoint
      @api_post_endpoint = api_post_endpoint
    end

    def listen!
      number += 1
      loop do
        puts "I am listening! #{number + 1}"
        number += 1
        break if number == 20000
      end
    end
  end
end

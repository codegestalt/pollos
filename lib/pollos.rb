require 'open-uri'

module Pollos
  # Public: Starts a new listener
  #
  # integer - Interval in seconds
  # get_endpoint - URL from where pollos gets the app hash
  # post_endpoint - URL where pollos sends the response back
  #
  # Returns: A new Listener Object
  #
  class Poller
    def initialize(interval, get_endpoint, post_endpoint)
      @interval = interval
      @get_endpoint = get_endpoint
      @post_endpoint = post_endpoint
    end

    def run!
      loop do
        # run shit in here
      end
    end
  end

  module Helper
  end

  module Parser
  end
end

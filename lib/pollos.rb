require 'open-uri'
require 'json'

require 'pollos/request'

module Pollos
  # Public: Starts a new listener
  #
  # integer - Interval in seconds
  #
  # Returns: A new Listener Object
  #
  class Poller
    def initialize(interval)
      @interval = interval
    end

    # Runs the polling process
    #
    # Returns: Nothing, can only die
    def run!
      loop do
        puts "Sending Request!"
        sleep(@interval)
      end
    end
  end

  # Public: Fetches the Hash of Apps from the API
  def self.get_request(uri)
    JSON.parse(open(uri){|f|f.read})
  end

  def self.post_answer
  end

end

require 'open-uri'
require 'json'

require 'pollos/job'

module Pollos
  # Public: Starts a new listener
  #
  # interval - Seconds-Interval as Integer
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
  #
  # uri - The URI of the application endpoint
  #
  # Returns: A Hash
  def self.get_apps(uri)
    JSON.parse(open(uri){|f|f.read})
  end

  def self.post_apps
  end

end

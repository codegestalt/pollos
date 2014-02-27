require 'net/http'
require 'json'
require 'benchmark'

require 'pollos/job'
require 'pollos/target'

module Pollos
  # Public: Starts a new listener
  #
  # interval - Seconds-Interval as Integer
  # source - URL of the source where we get our JSON string
  # target - URL of the target to send the response to
  #
  # Returns: A new Listener Object
  #
  class Poller
    def initialize(interval, source, target)
      @interval = interval
      @source = source
      @target = target
    end

    # Runs the polling process
    #
    # Returns: Nothing, can only die
    def run!
      loop do
        job = Job.new(get_apps)
        job.fetch_targets!
        post_messages!(job.to_hash)
        sleep(@interval)
      end
    end

    def get_apps
      Net::HTTP.get(URI.parse(@source))
    end

    def post_messages!(hash)
      Net::HTTP.post_form(URI.parse(@target), {'data'=>hash.to_json})
    end
  end

end

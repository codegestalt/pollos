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
        job = Job.new(open(@source))
        job.fetch_targets!
        post_data!(job.to_hash)
        sleep(@interval)
      end
    end

    def post_data!(data)
        Net::HTTP.post_form(URI.parse(@target), {'data'=>data})
    end
  end

end

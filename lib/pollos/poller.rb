module Pollos
  class Poller
    # Public: Creates a new listener
    #
    # interval - Seconds-Interval as Integer
    # source - URL of the source where we get our JSON string
    # target - URL of the target to send the response to
    #
    # Returns: A new Listener Object
    #
    def initialize(interval, source, target)
      @interval = interval
      @source = source
      @target = target
    end

    # Runs the polling process
    #
    # Returns: Nothing, can only die
    #
    def run!
      loop do
        begin
          job = Job.new(get_apps)
          job.fetch_targets!
          post_messages!(job.to_hash)
          sleep(@interval)
        rescue Errno::ECONNREFUSED => ce
          puts ""
          sleep(@interval)
        end

      end
    end
  end
end

module Pollos
  class Job

    attr_accessor :id, :endpoint_url, :endpoint_http_method,
                  :http_status_code, :request_sent_timestamp,
                  :answer_received_timestamp, :timeout

    def initialize(hash)
      hash.each {|k,v| send("#{k}=",v)}
    end

    # Public: Create an Array of Job Objects from a Hash
    #
    # hash - The Hash
    #
    # Returns: An Array of Job Objects
    def self.from_hash(hash)
      array = Array.new
      hash.each {|h| array << Job.new(h)}
      array
    end

  end
end

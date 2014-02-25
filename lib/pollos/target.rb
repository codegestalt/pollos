module Pollos
  class Target
    attr_accessor :id, :endpoint_url, :endpoint_http_method,
                  :http_status_code, :request_sent_timestamp,
                  :answer_received_timestamp, :timeout

    def initialize(hash)
      hash.each {|k,v| send("#{k}=",v)}
    end

    def to_hash
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end
  end
end

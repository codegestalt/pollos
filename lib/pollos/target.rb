module Pollos
  class Target
    attr_accessor :id, :endpoint_url, :endpoint_http_method,
                  :http_status_code, :response_time

    def initialize(hash)
      hash.each {|k,v| send("#{k}=",v)}
    end

    def to_hash
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash
    end

    def fetch!
      url = URI.parse(@endpoint_url)
      req = Net::HTTP.new(url.host, url.port)

      begin
        @response_time = Benchmark.measure { 
          @http_status_code = req.request_head(url).code
        }.real

      rescue SocketError => se
        "Got socket error"
      end
    end

  end
end

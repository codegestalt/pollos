module Pollos
  class Messenger
    def get_apps
      Net::HTTP.get(URI.parse(@source))
    end

    def post_messages!(hash)
      Net::HTTP.post_form(URI.parse(@target), {'data'=>hash.to_json})
    end
  end
end

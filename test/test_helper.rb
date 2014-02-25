$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require 'pollos'
require 'minitest/autorun'

class MiniTest::Test
  def default_environment
    { "GET_ENDPOINT" => "http://status.codegestalt.com/api/v1/apps",
      "POST_ENDPOINT" => "http://status.codegestalt.com/api/v1/messages"
    }
  end
end

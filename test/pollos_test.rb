require File.expand_path("../test_helper", __FILE__)

module Pollos
  class PollosTest < MiniTest::Test

    def setup
      get_endpoint = "http://status.codegestalt.com/api/v1/apps"
      post_endpoint = "http://status.codegestalt.com/api/v1/messages"
      @listener = Listener.new(300, get_endpoint, post_endpoint)
    end

    def test_initialize_listener
      assert_equal @listener.class, Listener
    end

  end
end

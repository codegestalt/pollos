require File.expand_path("../test_helper", __FILE__)

module Pollos
  class PollosTest < MiniTest::Test

    def setup
      @poller = Poller.new(5, "http://codegestalt.com", "http://codegestalt.com")
    end

    def test_initializer_returns_valid_poller
      assert_kind_of Poller, @poller
    end

  end
end

require File.expand_path("../test_helper", __FILE__)

module Pollos
  class PollosTest < MiniTest::Test

    def setup
      @poller = Poller.new(300, ENV["GET_ENDPOINT"], ENV["POST_ENDPOINT"])
    end

    def test_poller
      assert_equal @poller.class, Poller
    end

  end
end

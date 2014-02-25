require File.expand_path("../test_helper", __FILE__)

module Pollos
  class PollosTest < MiniTest::Test

    def setup
      @poller = Poller.new(300)
    end

    def test_initialize_poller
      assert_equal @poller.class, Poller
    end

    def test_get_request
      assert_equal Pollos.get_request(GET_ENDPOINT).class, Hash
    end

  end
end
